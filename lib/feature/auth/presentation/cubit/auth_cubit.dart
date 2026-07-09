import 'package:bloc/bloc.dart';
import '../../domain/use_case/is_logged_in_use_case/is_logged_in_use_case.dart';
import '../../domain/use_case/login_use_case/login_use_case.dart';
import '../../domain/use_case/login_with_google_use_case/login_with_google_use_case.dart';
import '../../domain/use_case/logout_use_case/logout_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final LogoutUseCase _logoutUseCase;
  final IsLoggedInUseCase _isLoggedInUseCase;

  AuthCubit({
    required this._loginUseCase,
    required this._loginWithGoogleUseCase,
    required this._logoutUseCase,
    required this._isLoggedInUseCase,
  })  : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _loginUseCase.execute(email, password);
    result.fold(
      (failure) => emit(AuthError(failure: failure)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    final result = await _loginWithGoogleUseCase.execute();
    result.fold(
      (failure) => emit(AuthError(failure: failure)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await _logoutUseCase.execute();
    result.fold(
      (failure) => emit(AuthError(failure: failure)),
      (_) => emit(AuthLogoutSuccess()),
    );
  }

  bool isLoggedIn() => _isLoggedInUseCase.execute();
}
