import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoCard extends StatelessWidget {
  final String imagePath;
  const LogoCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.h),
      height: 150.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(),
      ),
      child: Image.asset(
        imagePath,
        scale: 10,
      ),
    );
  }
}
