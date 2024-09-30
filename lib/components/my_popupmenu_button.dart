import 'package:choco_app/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyPopupmenuButton extends StatelessWidget {
  final IconData? icon;
  final String title;
  final void Function()? onTap;
  const MyPopupmenuButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(11.sp),
      padding: EdgeInsets.all(8.sp),
      child: PopupMenuItem(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            Gap(30.sp),
            Text(
              title,
              style: AppText.light(),
            )
          ],
        ),
      ),
    );
  }
}
