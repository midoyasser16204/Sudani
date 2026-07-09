import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_color.dart';
import '../theme/app_style.dart';
import '../resources/font_constants.dart';

class CustomTextInputField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool enabled;
  final int maxLines;
  final String? prefixIcon;
  final String? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final bool showBorder;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderRadius;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? suffix;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;

  const CustomTextInputField({
    super.key,
    required this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.enabled = true,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.showBorder = true,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius,
    this.height,
    this.contentPadding,
    this.hintStyle,
    this.textStyle,
    this.suffix,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: AppStyles.styleRegular14().copyWith(
              color: AppColor.primaryTextColor,
              fontWeight: FontWeightManager.medium,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        Container(
          height: widget.height ?? 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowLight,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            validator: widget.validator,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            style: widget.textStyle ??
                AppStyles.styleRegular14(),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  AppStyles.styleRegular14().copyWith(
                    color: AppColor.primaryTextColor.withValues(alpha: 0.85),
                  ),
              filled: true,
              fillColor: widget.fillColor ?? AppColor.white,
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(14.r),
                      child: SvgPicture.asset(
                        widget.prefixIcon!,
                        width: 20.w,
                        height: 20.h,
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryTextColor.withValues(alpha: 0.85),
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : null,
              suffixIcon: _buildSuffixIcon(),
              suffix: widget.suffix,
              border: widget.showBorder
                  ? OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 8.r),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? AppColor.primaryTextColor.withValues(alpha: 0.85),
                        width: 1.5,
                      ),
                    )
                  : InputBorder.none,
              enabledBorder: widget.showBorder
                  ? OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 8.r),
                      borderSide: BorderSide(
                        color: widget.borderColor ??
                            AppColor.primaryTextColor.withValues(alpha: 0.85),
                        width: 1.5,
                      ),
                    )
                  : InputBorder.none,
              focusedBorder: widget.showBorder
                  ? OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 8.r),
                      borderSide: BorderSide(
                        color: widget.focusedBorderColor ??
                            AppColor.secondaryColor,
                        width: 1.8,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: widget.showBorder
                  ? OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 8.r),
                      borderSide: BorderSide(
                        color: AppColor.errorTextColor,
                        width: 1.5,
                      ),
                    )
                  : InputBorder.none,
              focusedErrorBorder: widget.showBorder
                  ? OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 8.r),
                      borderSide: BorderSide(
                        color: AppColor.errorTextColor,
                        width: 1.8,
                      ),
                    )
                  : InputBorder.none,
              disabledBorder: widget.showBorder
                  ? OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius ?? 8.r),
                      borderSide: BorderSide(
                        color: AppColor.primaryTextColor.withValues(alpha: 0.85),
                        width: 1.5,
                      ),
                    )
                  : InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(14.r),
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            size: 20.r,
            color: AppColor.primaryTextColor.withValues(alpha: 0.85),
          ),
        ),
      );
    } else if (widget.suffixIcon != null) {
      return GestureDetector(
        onTap: widget.onSuffixIconTap,
        child: Padding(
          padding: EdgeInsets.all(14.r),
          child: SvgPicture.asset(
            widget.suffixIcon!,
            width: 20.w,
            height: 20.h,
            colorFilter: ColorFilter.mode(
              AppColor.primaryTextColor.withValues(alpha: 0.85),
              BlendMode.srcIn,
            ),
          ),
        ),
      );
    }
    return null;
  }
}
