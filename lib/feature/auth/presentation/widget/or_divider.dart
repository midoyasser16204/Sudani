import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_color.dart';
import 'package:sudani_app/core/theme/app_style.dart';

import '../../../../core/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.secondaryTextColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            S.of(context).or,
            style: AppStyles.styleRegular12().copyWith(
              color: AppColor.secondaryTextColor,
              fontWeight: FontWeightManager.medium,
              fontFamily: FontFamilyManager.openSans,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColor.secondaryTextColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}