import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/theme/app_style.dart';

import '../../../../core/resources/font_constants.dart';
import '../../../../core/theme/app_color.dart';

class AnnouncementCard extends StatelessWidget {
  final String header;
  final String details;
  final String date;

  const AnnouncementCard({
    super.key,
    required this.header,
    required this.details,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: AppStyles.styleRegular20().copyWith(
                    fontWeight: FontWeightManager.bold,
                    fontFamily: FontFamilyManager.ptSans,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  details,
                  style: AppStyles.styleRegular16().copyWith(
                    color: AppColor.primaryTextColor.withValues(alpha: .85),
                    fontFamily: FontFamilyManager.openSans,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  date,
                  style: AppStyles.styleRegular14().copyWith(
                    color: AppColor.secondaryTextColor,
                    fontFamily: FontFamilyManager.openSans,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: AppColor.lineBetweenCards,
          thickness: 1,
        ),
      ],
    );
  }
}
