import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class AppSnackBar {
  AppSnackBar._();

  static void success(BuildContext context, String message) {
    _show(
      context,
      message,
      AppColor.inTimeTextColor,
      Icons.check_circle,
    );
  }

  static void error(BuildContext context, String message) {
    _show(
      context,
      message,
      AppColor.errorTextColor,
      Icons.error,
    );
  }

  static void _show(
      BuildContext context,
      String message,
      Color color,
      IconData icon,
      ) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: color,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          content: Row(
            children: [
              Icon(icon, color: AppColor.white),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: AppColor.white),
                ),
              ),
            ],
          ),
        ),
      );
  }
}