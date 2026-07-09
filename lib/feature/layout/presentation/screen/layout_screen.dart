import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sudani_app/core/widgets/main_container.dart';
import 'package:sudani_app/feature/home/presentation/screen/home_screen.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/widgets/background_container.dart';
import '../../../announcements/presentation/screen/announcements_screen.dart';
import '../widget/bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const AnnouncementsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        if (currentIndex > 0) {
          setState(() {
            currentIndex = 0;
          });
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundContainer(
              child: Column(
                children: [
                  SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        SizedBox(height: 25.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: SvgPicture.asset(
                            Assets.logo,
                            width: 90.w,
                            height: 90.h,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(child: MainContainer(child: screens[currentIndex]))
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  if (currentIndex == index) {
                    return;
                  }
                  setState(() => currentIndex = index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
