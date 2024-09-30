import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextfield extends StatelessWidget {
  final bool obscuretext;
  final String hintText;

  MyTextfield({
    super.key,
    required this.obscuretext,
    required this.hintText,
  });
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppText.regular(color: AppColor.black, fontSize: 32.sp),
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.black),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColor.black),
        fillColor: AppColor.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.r),
            borderSide: const BorderSide(
              color: AppColor.grey,
            )),
      ),
    );
  }
}
