import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_color.dart';
import 'package:sudani_app/core/theme/app_style.dart';
import 'package:sudani_app/generated/l10n.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).login,
          style: AppStyles.styleRegular24().copyWith(
            fontWeight: FontWeightManager.bold,
            fontFamily: FontFamilyManager.openSans,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          S.of(context).welcomeBack,
          style: AppStyles.styleRegular14().copyWith(
            color: AppColor.primaryTextColor.withValues(alpha: 0.85),
            fontFamily: FontFamilyManager.openSans,
          ),
        ),
      ],
    );
  }
}