import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartFab extends StatelessWidget {
  const CartFab({super.key});

  @override
  Widget build(BuildContext context) {
    final myCart = context.watch<CartModule>().cart;
    return FloatingActionButton(
      backgroundColor: AppColor.white,
      onPressed: () {
        Navigator.of(context).pushNamed("/cart");
      },
      child: Stack(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: const BoxDecoration(
                color: Colors.transparent, shape: BoxShape.circle),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 7.h,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.black,
              size: 70.h,
            ),
          ),
          Positioned(
            left: 38.w,
            top: 2.h,
            child: Container(
              width: 30.w,
              height: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.secondary,
              ),
              child: Center(
                child: Text(
                  myCart.length.toString(),
                  style: AppText.semiBoldHeader(
                      color: AppColor.white, fontSize: 25.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
