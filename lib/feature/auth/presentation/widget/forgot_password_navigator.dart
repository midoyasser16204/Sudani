import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_color.dart';
import 'package:sudani_app/core/theme/app_style.dart';
import 'package:sudani_app/generated/l10n.dart';

class ForgotPasswordNavigator extends StatelessWidget {
  final bool isEnglish;
  final VoidCallback onPressed;

  const ForgotPasswordNavigator({
    super.key,
    required this.isEnglish,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isEnglish
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 4.h,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          S.of(context).forgotPassword,
          style: AppStyles.styleRegular14().copyWith(
            color: AppColor.secondaryColor,
            fontWeight: FontWeightManager.medium,
            fontFamily: FontFamilyManager.openSans,
          ),
        ),
      ),
    );
  }
}