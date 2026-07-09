import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/user_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> loginWithGoogle();

  Future<Either<Failure, void>> logout();

  bool isLoggedIn();
}