import 'package:choco_app/modules/cart_module.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:choco_app/modules/product_module.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // transparent container for overflow
        Container(
          width: 280.w,
          height: 380.h,
          color: Colors.transparent,
        ),

        // positioned for curved card
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child:
              // container for curved card
              Container(
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            height: 280.h,
            decoration: BoxDecoration(
              color: AppColor.primarylite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(110.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.productname,
                  style: AppText.light(fontSize: 40.r),
                ),
                Text(
                  product.productname2,
                  style: AppText.light(fontSize: 40.r),
                ),
                Gap(8.sp),
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium_rounded,
                      size: 25.sp,
                      color: AppColor.secondary,
                    ),
                    Gap(15.sp),
                    Text(
                      "PREMIUM",
                      style: AppText.light(
                          fontSize: 23.sp, color: AppColor.secondary),
                    )
                  ],
                ),
                Gap(8.sp),
                Text(
                  "\$${product.price.toString()}",
                  style: AppText.light(fontSize: 35.sp),
                ),
              ],
            ),
          ),
        ),

        //positioned icon
        Positioned(
          bottom: 1.h,
          right: -1.w,
          child: GestureDetector(
            onTap: () {
              context.read<CartModule>().addProductToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  closeIconColor: Colors.black,
                  behavior: SnackBarBehavior.floating,
                  showCloseIcon: true,
                  content: Text(
                    "Item successfully added to cart",
                    style: AppText.regular(fontSize: 30.sp),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              width: 70.w,
              height: 70.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.black,
              ),
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ),
        ),

        //positioned image
        Positioned(
          left: 0,
          right: 0,
          bottom: 172.h,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(0.5),
                  blurRadius: 20.r,
                  spreadRadius: -75.r,
                  offset: Offset(0, 12.h),
                ),
              ],
            ),
            child: Image.asset(
              product.productnameimage,
              scale: 7.1.h,
            ),
          ),
        )
      ],
    );
  }
}
