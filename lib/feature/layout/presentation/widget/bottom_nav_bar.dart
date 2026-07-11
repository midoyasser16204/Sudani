import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/generated/l10n.dart';
import '../../../../core/theme/app_color.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(19.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryTextColor.withValues(alpha: 0.10),
            blurRadius: 12,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            BottomNavItem(
              isSelected: currentIndex == 0,
              icon: Assets.home,
              label: S.of(context).home,
              onTap: () => onTap(0),
            ),
            BottomNavItem(
              isSelected: currentIndex == 1,
              icon: Assets.announcement,
              label: S.of(context).announcements,
              onTap: () => onTap(1),
            ),
          ],
        ),
      ),
    );
  }
}