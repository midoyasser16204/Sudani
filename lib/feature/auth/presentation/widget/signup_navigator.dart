import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_color.dart';
import 'package:sudani_app/core/theme/app_style.dart';
import 'package:sudani_app/generated/l10n.dart';

class SignupNavigator extends StatelessWidget {
  final VoidCallback onTap;

  const SignupNavigator({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).dontHaveAccount,
              style: AppStyles.styleRegular14().copyWith(
                color: AppColor.primaryTextColor.withValues(alpha: 0.85),
                fontFamily: FontFamilyManager.openSans,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              S.of(context).signUp,
              style: AppStyles.styleRegular14().copyWith(
                color: AppColor.secondaryColor,
                fontWeight: FontWeightManager.bold,
                fontFamily: FontFamilyManager.openSans,
              ),
            ),
          ],
        ),
      ),
    );
  }
}