import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.5.w,
          color: AppColor.white,
        ),
      ),
      child: CircleAvatar(
        radius: 46.sp,
        backgroundImage: const AssetImage(
          "assets/images/introimage.jpg",
        ),
      ),
    );
  }
}
