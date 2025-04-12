import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/modules/product_module.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OffersCard extends StatelessWidget {
  final Products promoproduct;
  const OffersCard({super.key, required this.promoproduct});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // container for curved card
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.primarylite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(120.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    promoproduct.productnameimage,
                    scale: 17.h,
                    fit: BoxFit.cover,
                  ),
                  Gap(15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        promoproduct.productname,
                        style: AppText.light(fontSize: 40.sp),
                      ),
                      Text(
                        promoproduct.productname2,
                        style: AppText.light(fontSize: 40.sp),
                      ),
                      Gap(7.h),
                      Row(
                        children: [
                          Icon(
                            Icons.workspace_premium_rounded,
                            size: 25.h,
                            color: AppColor.secondary,
                          ),
                          Gap(18.h),
                          Text(
                            "PREMIUM",
                            style: AppText.light(
                                fontSize: 23.sp, color: AppColor.secondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 75.w, top: 50.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$${promoproduct.price.toString()}",
                      style: AppText.extraLight(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Gap(6.h),
                    Text(
                      "\$${promoproduct.promoprice.toString()}",
                      style: AppText.light(fontSize: 30.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //positioned icon
        Positioned(
          bottom: 5.h,
          right: 5.w,
          child: GestureDetector(
            onTap: () {
              context.read<CartModule>().addProductToCart(promoproduct);
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
              child: Icon(
                Icons.add,
                size: 40.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
