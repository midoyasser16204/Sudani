import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/widgets/app_snack_bar.dart';
import 'package:sudani_app/core/widgets/border_button.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/generated/l10n.dart';
import '../../../../core/theme/app_color.dart';
import '../cubit/location_cubit.dart';
import '../cubit/location_state.dart';
import '../../../../core/widgets/custom_dialog.dart';
import 'google_maps_widget.dart';
import 'info_card.dart';

class CheckInOutCard extends StatefulWidget {
  const CheckInOutCard({super.key});

  @override
  State<CheckInOutCard> createState() => _CheckInOutCardState();
}

class _CheckInOutCardState extends State<CheckInOutCard> {
  bool isCheckedOut = false;
  final TextEditingController _justificationController = TextEditingController();
  late final LocationCubit _locationCubit;

  @override
  void initState() {
    super.initState();
    _locationCubit = getIt<LocationCubit>();
  }

  @override
  void dispose() {
    _justificationController.dispose();
    _locationCubit.close();
    super.dispose();
  }

  void _handleCheckout() {
    if (isCheckedOut) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).notRegisteredYet),
          backgroundColor: AppColor.inTimeTextColor,
        ),
      );
      return;
    }

    // Highest priority: check if user is out of boundary
    final locationState = _locationCubit.state;
    if (locationState is LocationLoaded && locationState.isOutOfBoundary) {
      _showOutOfBoundaryDialog();
      return;
    }

    _showEarlyCheckoutDialog();
  }

  void _showOutOfBoundaryDialog() {
    CustomDialog.show(
      context: context,
      title: S.of(context).outOfBoundaries,
      subtitle: S.of(context).addJustification,
      showInput: true,
      inputField: TextField(
        maxLines: 3,
        decoration: InputDecoration(
          hintText: S.of(context).writeJustification,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColor.textInputFieldBorderInDialog,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColor.textInputFieldBorderInDialog,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColor.textInputFieldBorderInDialog,
            ),
          ),
        ),
      ),
      warningMessage: S.of(context).incompleteWorkingHours,
      confirmButtonText: S.of(context).confirmCheckout,
      cancelButtonText: S.of(context).cancel,
      onConfirm: () {
        Navigator.of(context).pop();
        _performCheckout();
      },
      onCancel: () {
        Navigator.of(context).pop();
      },
    );
  }

  void _showEarlyCheckoutDialog() {
    CustomDialog.show(
      context: context,
      title: S.of(context).earlyCheckout,
      warningMessage: S.of(context).incompleteWorkingHours,
      confirmButtonText: S.of(context).confirmCheckout,
      cancelButtonText: S.of(context).cancel,
      onConfirm: () {
        Navigator.of(context).pop();
        _performCheckout();
      },
      onCancel: () {
        Navigator.of(context).pop();
      },
    );
  }

  void _performCheckout({String? justification}) {
    setState(() {
      isCheckedOut = true;
    });

    AppSnackBar.success(context, "Checkout successful!");

    if (justification != null) {
      print('Justification: $justification');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowDark,
            blurRadius: 16,
            offset: const Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              InfoCard(
                title: S.of(context).checkInTime,
                value: S.of(context).time,
                subtitle: S.of(context).onTime,
                subtitleColor: AppColor.inTimeTextColor,
                subtitleBackgroundColor: AppColor.inTimeLayoutColor,
                showContainer: true,
                valueTextDirection: TextDirection.ltr,
              ),
              SizedBox(width: 12.w),
              InfoCard(
                title: S.of(context).checkOutTime,
                value: isCheckedOut ? S.of(context).time : S.of(context).notRegisteredYet,
                subtitle: isCheckedOut ? S.of(context).onTime : S.of(context).pending,
                subtitleColor: isCheckedOut ? AppColor.inTimeTextColor : AppColor.waitingTextColor,
                subtitleBackgroundColor: isCheckedOut ? AppColor.inTimeLayoutColor : AppColor.waitingLayoutColor,
                showContainer: true,
              ),
            ],
          ),
          SizedBox(height: 20.h),

          BlocProvider.value(
            value: _locationCubit,
            child: const GoogleMapsWidget(),
          ),
          SizedBox(height: 20.h),

          SizedBox(
            width: double.infinity,
            child: BorderButton(
              text: S.of(context).registerCheckOut,
              onPressed: _handleCheckout,
            ),
          ),
        ],
      ),
    );
  }
}
