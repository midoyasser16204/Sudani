import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_style.dart';
import '../../../../core/theme/app_color.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final Color? subtitleColor;
  final Color? subtitleBackgroundColor;
  final bool showContainer;
  final TextDirection? valueTextDirection;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.subtitleColor,
    this.subtitleBackgroundColor,
    this.showContainer = true,
    this.valueTextDirection,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleRegular12().copyWith(
            color: AppColor.primaryTextColor.withValues(alpha: 0.75),
            fontFamily: FontFamilyManager.openSans,
            fontWeight: FontWeightManager.semiBold
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          textDirection: valueTextDirection,
          style: AppStyles.styleRegular24().copyWith(
              fontFamily: FontFamilyManager.ptSans,
              fontWeight: FontWeightManager.bold
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 4.h,
            ),
            decoration: BoxDecoration(
              color: subtitleBackgroundColor ?? AppColor.backgroundColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              '● $subtitle',
              style: AppStyles.styleRegular12().copyWith(
                  color: subtitleColor ?? AppColor.inTimeTextColor,
                  fontFamily: FontFamilyManager.openSans,
              ),
            ),
          ),
        ],
      ],
    );

    if (!showContainer) {
      return content;
    }

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowMedium,
              blurRadius: 8,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: content,
      ),
    );
  }
}
