import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_color.dart';
import 'package:sudani_app/core/theme/app_style.dart';

class BottomNavItem extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String label;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(19.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 48.h,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColor.secondaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(19.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                width: 24.w,
                height: 24.h,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? AppColor.white
                      : AppColor.primaryTextColor.withValues(alpha: 0.5),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppStyles.styleRegular14().copyWith(
                  fontFamily: FontFamilyManager.openSans,
                  color: isSelected
                      ? AppColor.white
                      : AppColor.primaryTextColor.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}