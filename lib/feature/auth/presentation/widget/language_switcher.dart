import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_style.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/generated/l10n.dart';
import '../../../../core/theme/app_color.dart';

class LanguageSwitcher extends StatelessWidget {
  final bool isEnglish;
  final VoidCallback onTap;

  const LanguageSwitcher({
    super.key,
    required this.isEnglish,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          right: isEnglish ? 0 : 20.w,
          left: isEnglish ? 20.w : 0,
        ),
        child: Align(
          alignment:
          isEnglish ? Alignment.centerLeft : Alignment.centerRight,
          child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isEnglish) ...[
                  Text(
                    S.of(context).language,
                    style: AppStyles.styleRegular14().copyWith(
                      fontWeight: FontWeightManager.semiBold,
                      color: AppColor.white,
                      fontFamily: FontFamilyManager.openSans,
                    ),
                  ),
                  SizedBox(width: 8.w),
                ],
                Image.asset(
                  isEnglish ? Assets.saFlag : Assets.ukFlag,
                  width: 48.w,
                  height: 20.h,
                ),
                if (isEnglish) ...[
                  SizedBox(width: 8.w),
                  Text(
                    S.of(context).language,
                    style: AppStyles.styleRegular14().copyWith(
                      fontWeight: FontWeightManager.semiBold,
                      color: Colors.white,
                      fontFamily: FontFamilyManager.openSans,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}