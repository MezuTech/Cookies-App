import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // access cart provider

    final cartQuantity = context.watch<CartModule>().cart;
    return Stack(
      children: [
        // empty transparent container for ofsett
        Container(
          color: Colors.transparent,
          width: 130.sp,
          height: 180.sp,
        ),
        // positioned for product count
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child:
              // container for product count
              GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/cart");
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              height: 140.sp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cartQuantity.length.toString(),
                    style: AppText.semiBoldHeader(
                      color: AppColor.black,
                      fontSize: 33.sp,
                    ),
                  ),
                  Text(
                    'Products',
                    style: AppText.semiBoldHeader(
                      color: AppColor.black,
                      fontSize: 28.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //positioned for circle icon
        Positioned(
          left: 0,
          right: 0,
          bottom: 120.sp,
          child:
              //positioned for circle icon
              GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/cart");
            },
            child: Container(
              height: 50.sp,
              width: 50.sp,
              decoration: const BoxDecoration(
                  color: AppColor.black, shape: BoxShape.circle),
              child: ClipRect(
                child: ClipOval(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 30.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
