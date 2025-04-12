import 'dart:ui';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatelessWidget {
  final void Function(int)? ontap;
  final int currentIndex;
  const BottomBar({super.key, required this.currentIndex, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // empty container
        Container(
          color: Colors.transparent,
          height: 128.h,
          width: double.infinity,
        ),
        // dark curved container at the bottom
        Positioned(
          top: 53.sp,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
            ),
            height: 75.h,
            width: double.infinity,
          ),
        ),

        // Bottom navigation bar with a slight offset
        Positioned(
          bottom: 5.sp,
          left: 35.sp,
          right: 35.sp,
          child:
              // used to remove blur BNB widget
              BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            blendMode: BlendMode.screen,
            child: BottomNavigationBar(
              onTap: ontap,
              currentIndex: currentIndex,
              selectedItemColor: AppColor.secondary,
              selectedIconTheme:
                  IconThemeData(color: AppColor.secondary, size: 40.sp),
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: AppText.light(fontSize: 25.sp),
              unselectedLabelStyle: AppText.light(),
              backgroundColor: Colors.transparent,
              iconSize: 30.sp,
              items: [
                // home icon
                BottomNavigationBarItem(
                    icon: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primarylite,
                      ),
                      width: 58.sp,
                      height: 68.sp,
                      child: const Icon(Icons.home),
                    ),
                    label: "Home"),
                // search icon
                BottomNavigationBarItem(
                    icon: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primarylite,
                      ),
                      width: 58.sp,
                      height: 68.sp,
                      child: const Icon(Icons.search_outlined),
                    ),
                    label: "Search"),
                // premium icon
                BottomNavigationBarItem(
                    icon: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primarylite,
                      ),
                      width: 58.sp,
                      height: 68.sp,
                      child: const Icon(Icons.manage_accounts_outlined),
                    ),
                    label: "Account"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
