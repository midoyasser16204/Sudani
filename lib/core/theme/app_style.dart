import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/font_constants.dart';
import 'app_color.dart';

abstract class AppStyles {
  static TextStyle styleRegular12() {
    return TextStyle(
      color: AppColor.primaryTextColor,
      fontSize: 12.sp,
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle styleRegular14() {
    return TextStyle(
      color: AppColor.primaryTextColor,
      fontSize: 14.sp,
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle styleRegular16() {
    return TextStyle(
      color: AppColor.primaryTextColor,
      fontSize: 16.sp,
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle styleRegular18() {
    return TextStyle(
      color: AppColor.primaryTextColor,
      fontSize: 18.sp,
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle styleRegular20() {
    return TextStyle(
      color: AppColor.primaryTextColor,
      fontSize: 20.sp,
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle styleRegular24() {
    return TextStyle(
      color: AppColor.primaryTextColor,
      fontSize: 24.sp,
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle styleRegular28() {
    return TextStyle(
      color: AppColor.primaryTextColor,
      fontSize: 28.sp,
      fontWeight: FontWeightManager.regular,
    );
  }

  static TextStyle styleRegular30() {
    return TextStyle(
      color: AppColor.primaryTextColor,
      fontSize: 30.sp,
      fontWeight: FontWeightManager.regular,
    );
  }
}