import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyAppbar extends StatelessWidget implements PreferredSize {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(15.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                Gap(90.w),
                Text(
                  "Account",
                  style: AppText.boldHeader(fontSize: 60.sp),
                ),
              ],
            ),
            Gap(50.h),
            Text(
              "Hi Mezu!",
              style: AppText.semiBoldHeader(
                  fontSize: 40.sp, color: AppColor.secondary),
            ),
            Text(
              "mezueric@gmail.com",
              style: AppText.extraLight(),
            ),
            Gap(30.h),
            Container(
              padding: EdgeInsets.all(10.h),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColor.secondary,
              ),
              child: Text(
                "choco account balance: \$0",
                style: AppText.semiBoldHeader(fontSize: 30.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => Size(double.maxFinite, 360.h);
}
