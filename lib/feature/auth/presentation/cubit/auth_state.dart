import '../../../../core/error/failure.dart';
import '../../domain/entity/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  AuthSuccess({required this.user});
}

class AuthError extends AuthState {
  final Failure failure;
  AuthError({required this.failure});
  String get message => failure.message;
}

class AuthLogoutSuccess extends AuthState {}
