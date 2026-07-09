import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sudani_app/core/resources/font_constants.dart';
import '../theme/app_color.dart';
import '../theme/app_style.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String? iconPath;

  const BorderButton({
    super.key,
    required this.text,
    this.onPressed,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 330.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.white,
          border: Border.all(
            color: AppColor.secondaryColor,
            width: 1.8,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              SvgPicture.asset(
                iconPath!,
                width: 18.w,
                height: 18.h,
              ),
              SizedBox(width: 8.w),
            ],
            Text(
              text,
              style: AppStyles.styleRegular14().copyWith(
                color: AppColor.secondaryColor,
                fontWeight: FontWeightManager.semiBold,
                fontFamily: FontFamilyManager.openSans,
              ),
            ),
          ],
        ),
      ),
    );
  }
}