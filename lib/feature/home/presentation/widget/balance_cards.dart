import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/generated/l10n.dart';
import 'info_card.dart';

class BalanceCards extends StatelessWidget {
  const BalanceCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InfoCard(
            title: S.of(context).regularBalance,
            value: "11 ${S.of(context).days}",
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: InfoCard(
            title: S.of(context).emergencyBalance,
            value: "4 ${S.of(context).days}",
          ),
        ),
      ],
    );
  }
}
