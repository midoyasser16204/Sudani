import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../repository/authentication_repository.dart';
import 'logout_use_case.dart';

class LogoutUseCaseImpl implements LogoutUseCase {
  final AuthenticationRepository _repository;

  LogoutUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, void>> execute() {
    return _repository.logout();
  }
}
