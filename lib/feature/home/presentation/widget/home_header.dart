import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sudani_app/core/di/dependency_injection.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_style.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/routes/route_center.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late final AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = getIt<AuthCubit>();
  }

  @override
  void dispose() {
    _authCubit.close();
    super.dispose();
  }

  void _onLogoutPressed() {
    CustomDialog.show(
      context: context,
      title: S.of(context).logout,
      subtitle: S.of(context).logoutConfirm,
      confirmButtonText: S.of(context).confirm,
      cancelButtonText: S.of(context).cancel,
      onConfirm: () {
        Navigator.of(context).pop();
        _authCubit.logout();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>.value(
      value: _authCubit,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLogoutSuccess) {
            context.go(RouteCenter.login);
          }
        },
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(Assets.avatar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // User info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).helloMohamed,
                  style: AppStyles.styleRegular18().copyWith(
                    fontWeight: FontWeightManager.bold,
                    fontFamily: FontFamilyManager.ptSans,
                  ),
                ),
                Text(
                  S.of(context).developmentTeam,
                  style: AppStyles.styleRegular12().copyWith(
                    fontWeight: FontWeightManager.semiBold,
                    color: AppColor.primaryTextColor.withValues(alpha: .75),
                    fontFamily: FontFamilyManager.ptSans,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: _onLogoutPressed,
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.shadowMedium,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.signOut,
                    width: 25.w,
                    height: 25.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
