import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import '../theme/app_color.dart';
import '../theme/app_style.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 330.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: const LinearGradient(
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
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppStyles.styleRegular14().copyWith(
            color: AppColor.white,
            fontWeight: FontWeightManager.semiBold,
            fontFamily: FontFamilyManager.openSans,
          ),
        ),
      ),
    );
  }
}
