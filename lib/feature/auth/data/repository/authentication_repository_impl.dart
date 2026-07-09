import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  static final String _googleServerClientId = Strings.googleClientId;

  static Future<void>? _googleSignInInitFuture;

  AuthenticationRepositoryImpl({
    required this._firebaseAuth,
    required this._firestore,
  });

  Future<void> _ensureGoogleSignInInitialized() {
    return _googleSignInInitFuture ??= GoogleSignIn.instance.initialize(
      serverClientId: _googleServerClientId,
    );
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid == null) {
        return const Left(AuthFailure('Login failed: user data not found.'));
      }

      final userDoc = await _firestore
          .collection(Strings.usersCollection)
          .doc(uid)
          .get();

      if (!userDoc.exists || userDoc.data() == null) {
        return const Left(
          ServerFailure('User profile not found. Please contact support.'),
        );
      }

      return Right(UserEntity.fromMap(userDoc.data()!));
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication failed.'));
    } catch (e) {
      return Left(UnknownFailure('Login failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      await _ensureGoogleSignInInitialized();

      final GoogleSignIn signIn = GoogleSignIn.instance;

      if (!signIn.supportsAuthenticate()) {
        return const Left(GoogleSignInFailure(
          'This platform requires the Google Sign-In button flow; '
          'authenticate() is not supported here.',
        ));
      }

      final GoogleSignInAccount googleUser = await signIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final uid = userCredential.user?.uid;
      final email = userCredential.user?.email;
      if (uid == null || email == null) {
        return const Left(
          GoogleSignInFailure('Google Sign-In failed: missing user data.'),
        );
      }
      final displayName = userCredential.user?.displayName ?? '';

      final userDoc = await _firestore
          .collection(Strings.usersCollection)
          .doc(uid)
          .get();

      UserEntity userEntity;
      if (userDoc.exists && userDoc.data() != null) {
        userEntity = UserEntity.fromMap(userDoc.data()!);
      } else {
        userEntity = UserEntity(uid: uid, email: email, fullName: displayName);
        await _firestore
            .collection(Strings.usersCollection)
            .doc(uid)
            .set(userEntity.toMap());
      }

      return Right(userEntity);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return const Left(GoogleSignInFailure('Google Sign-In was cancelled.'));
      }
      return Left(
        GoogleSignInFailure(
          'Google Sign-In failed: ${e.code} ${e.description}',
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication failed.'));
    } catch (e) {
      return Left(UnknownFailure('Google Sign-In failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await GoogleSignIn.instance.signOut();
    } catch (e) {
      debugPrint('Google sign-out error (non-fatal): $e');
    }
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure('Logout failed: ${e.toString()}'));
    }
  }

  @override
  bool isLoggedIn() => _firebaseAuth.currentUser != null;
}