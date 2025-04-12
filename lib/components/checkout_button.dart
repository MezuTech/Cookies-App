import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckoutButton extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onTap;
  const CheckoutButton(
      {super.key,
      this.onTap,
      this.width = double.infinity,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(35.h),
        child: Container(
          padding: EdgeInsets.all(20.sp),
          height: 140.h,
          width: width,
          color: AppColor.primary,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColor.secondary,
            ),
            child: Center(
              child: Text(
                text,
                style: AppText.semiBoldHeader(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
