import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    //access provider for total price
    final checkout = context.select(
      (CartModule cartmodule) => cartmodule.totalPrice,
    );
    return Container(
      padding: EdgeInsets.all(20.sp),
      height: 140.h,
      width: double.infinity,
      color: AppColor.primary,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.secondary,
        ),
        child: Center(
          child: Text(
            "Checkout (\$${checkout.toStringAsFixed(2)})",
            style: AppText.semiBoldHeader(),
          ),
        ),
      ),
    );
  }
}
