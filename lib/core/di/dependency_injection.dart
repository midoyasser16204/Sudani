import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../../feature/auth/data/repository/authentication_repository_impl.dart';
import '../../feature/auth/domain/repository/authentication_repository.dart';
import '../../feature/auth/domain/use_case/is_logged_in_use_case/is_logged_in_use_case.dart';
import '../../feature/auth/domain/use_case/is_logged_in_use_case/is_logged_in_use_case_impl.dart';
import '../../feature/auth/domain/use_case/login_use_case/login_use_case.dart';
import '../../feature/auth/domain/use_case/login_use_case/login_use_case_impl.dart';
import '../../feature/auth/domain/use_case/login_with_google_use_case/login_with_google_use_case.dart';
import '../../feature/auth/domain/use_case/login_with_google_use_case/login_with_google_use_case_impl.dart';
import '../../feature/auth/domain/use_case/logout_use_case/logout_use_case.dart';
import '../../feature/auth/domain/use_case/logout_use_case/logout_use_case_impl.dart';
import '../../feature/auth/presentation/cubit/auth_cubit.dart';
import '../../feature/home/domain/use_case/get_current_location_use_case/get_current_location_use_case.dart';
import '../../feature/home/domain/use_case/get_current_location_use_case/get_current_location_use_case_impl.dart';
import '../../feature/home/domain/use_case/get_location_stream_use_case/get_location_stream_use_case.dart';
import '../../feature/home/domain/use_case/get_location_stream_use_case/get_location_stream_use_case_impl.dart';
import '../../feature/home/presentation/cubit/location_cubit.dart';
import '../../feature/splash/presentation/cubit/splash_cubit.dart';
import '../cubit/locale_cubit.dart';
import '../services/location_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // External dependencies
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Repositories
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  // Services
  getIt.registerLazySingleton<LocationService>(() => LocationService());

  // Use Cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCaseImpl(getIt<AuthenticationRepository>()),
  );

  getIt.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCaseImpl(getIt<AuthenticationRepository>()),
  );

  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCaseImpl(getIt<AuthenticationRepository>()),
  );

  getIt.registerLazySingleton<IsLoggedInUseCase>(
    () => IsLoggedInUseCaseImpl(getIt<AuthenticationRepository>()),
  );

  getIt.registerLazySingleton<GetCurrentLocationUseCase>(
    () => GetCurrentLocationUseCaseImpl(getIt<LocationService>()),
  );

  getIt.registerLazySingleton<GetLocationStreamUseCase>(
    () => GetLocationStreamUseCaseImpl(getIt<LocationService>()),
  );

  // Cubits
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<IsLoggedInUseCase>()),
  );

  getIt.registerFactory<LocationCubit>(
    () => LocationCubit(
      getIt<GetCurrentLocationUseCase>(),
      getIt<GetLocationStreamUseCase>(),
    ),
  );

  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: getIt<LoginUseCase>(),
      loginWithGoogleUseCase: getIt<LoginWithGoogleUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
      isLoggedInUseCase: getIt<IsLoggedInUseCase>(),
    ),
  );
}
