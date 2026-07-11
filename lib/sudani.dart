import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/strings.dart';
import 'core/cubit/locale_cubit.dart';
import 'core/di/dependency_injection.dart';
import 'core/generated/l10n.dart';
import 'core/routes/app_router.dart';

class Sudani extends StatelessWidget {
  const Sudani({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCubit = getIt<LocaleCubit>();
    return BlocBuilder<LocaleCubit, Locale>(
      bloc: localeCubit,
      builder: (context, locale) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              locale: locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: Strings.appName,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.routes,
            );
          },
        );
      },
    );
  }
}
