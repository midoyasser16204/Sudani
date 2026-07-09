import '../../repository/authentication_repository.dart';
import 'is_logged_in_use_case.dart';

class IsLoggedInUseCaseImpl implements IsLoggedInUseCase {
  final AuthenticationRepository _repository;

  IsLoggedInUseCaseImpl(this._repository);

  @override
  bool execute() {
    return _repository.isLoggedIn();
  }
}
