import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/routes/route_center.dart';
import '../../../../core/theme/app_color.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashCubit>()..startSplashTimer(),

      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToLayout) {
            context.go(RouteCenter.layout);
          } else if (state is SplashNavigateToLogin) {
            context.go(RouteCenter.login);
          }
        },

        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColor.darkBlue,
                  AppColor.secondaryColor,
                  AppColor.secondaryColor,
                ],
                stops: [0.0, 0.38, 1.0],
              ),
            ),

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.logo,
                    width: 250.w,
                    height: 250.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
