import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudani_app/core/theme/app_style.dart';
import 'package:sudani_app/feature/announcements/presentation/widget/announcement_card.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/resources/font_constants.dart';
import '../../../../generated/l10n.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Text(
              S.of(context).announcements,
              style: AppStyles.styleRegular28().copyWith(
                fontWeight: FontWeightManager.bold,
                fontFamily: FontFamilyManager.ptSans,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 80.h),
              itemCount: 3,
              itemBuilder: (context, index) {
                return AnnouncementCard(
                  header: S.of(context).announcementsHeader,
                  details: S.of(context).announcementsDetail,
                  date: S.of(context).announcementsDate,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
