import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/domain/use_case/is_logged_in_use_case/is_logged_in_use_case.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final IsLoggedInUseCase _isLoggedInUseCase;

  SplashCubit(this._isLoggedInUseCase) : super(SplashInitial());

  void startSplashTimer() {
    Timer(const Duration(seconds: 3), () {
      if (_isLoggedInUseCase.execute()) {
        emit(SplashNavigateToLayout());
      } else {
        emit(SplashNavigateToLogin());
      }
    });
  }
}
