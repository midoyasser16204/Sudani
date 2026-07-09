import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sudani_app/core/resources/font_constants.dart';
import 'package:sudani_app/core/theme/app_color.dart';
import 'package:sudani_app/core/theme/app_style.dart';
import 'package:sudani_app/core/widgets/border_button.dart';
import 'package:sudani_app/core/widgets/gradient_button.dart';

import '../constants/assets.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? warningMessage;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final Widget? inputField;
  final bool showInput;

  const CustomDialog({
    super.key,
    required this.title,
    this.subtitle,
    this.warningMessage,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirm,
    this.onCancel,
    this.inputField,
    this.showInput = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
      backgroundColor: AppColor.primaryColor,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.styleRegular24().copyWith(
                fontWeight: FontWeightManager.bold,
                fontFamily: FontFamilyManager.ptSans,
              ),
            ),

            if (subtitle != null) ...[
              SizedBox(height: 8.h),
              Text(
                subtitle!,
                style: AppStyles.styleRegular14().copyWith(
                  fontFamily: FontFamilyManager.openSans,
                  color: AppColor.secondaryTextColor,
                ),
              ),
            ],

            if (showInput && inputField != null) ...[
              SizedBox(height: 16.h),
              inputField!,
            ],

            SizedBox(height: 16.h),
            if (warningMessage != null) ...[
            Row(
              children: [
                SvgPicture.asset(Assets.error, width: 15.w, height: 15.h),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    warningMessage!,
                    style: AppStyles.styleRegular14().copyWith(
                      fontFamily: FontFamilyManager.openSans,
                      color: AppColor.errorTextColor,
                      fontWeight: FontWeightManager.semiBold,
                    ),
                  ),
                ),
              ],
            ),
            ],

            SizedBox(height: 24.h),

            Center(
              child: GradientButton(
                text: confirmButtonText,
                onPressed: onConfirm,
              ),
            ),

            SizedBox(height: 12.h),

            Center(
              child: BorderButton(
                text: cancelButtonText,
                onPressed: onCancel ?? () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> show({
    required BuildContext context,
    required String title,
    String? subtitle,
    String? warningMessage,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    Widget? inputField,
    bool showInput = false,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => CustomDialog(
        title: title,
        subtitle: subtitle,
        warningMessage: warningMessage,
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        inputField: inputField,
        showInput: showInput,
      ),
    );
  }
}