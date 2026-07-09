import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../entity/user_entity.dart';
import '../../repository/authentication_repository.dart';
import 'login_use_case.dart';

class LoginUseCaseImpl implements LoginUseCase {
  final AuthenticationRepository _repository;

  LoginUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, UserEntity>> execute(String email, String password) {
    return _repository.login(email: email, password: password);
  }
}