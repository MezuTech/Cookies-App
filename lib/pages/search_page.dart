import 'package:choco_app/components/cart_fab.dart';
import 'package:choco_app/components/my_search.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const CartFab(),
        body: Stack(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Positioned(
              top: 15.h,
              left: 15.w,
              child: GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                },
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white.withOpacity(0.5.sp),
                  ),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Gap(120.h),
                Padding(
                  padding: EdgeInsets.all(30.sp),
                  child: GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: MySearch());
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      height: 100.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColor.white),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: AppColor.black,
                          ),
                          Gap(30.w),
                          Text(
                            "Search",
                            style: AppText.regular(color: AppColor.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(400.h),
                Center(
                  child: Text(
                    "Search your favorite chocolate",
                    style: AppText.boldHeader(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
