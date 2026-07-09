import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../entity/user_entity.dart';
import '../../repository/authentication_repository.dart';
import 'login_with_google_use_case.dart';

class LoginWithGoogleUseCaseImpl implements LoginWithGoogleUseCase {
  final AuthenticationRepository _repository;

  LoginWithGoogleUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, UserEntity>> execute() {
    return _repository.loginWithGoogle();
  }
}
