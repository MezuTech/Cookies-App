import 'package:choco_app/components/cart_widget.dart';
import 'package:choco_app/components/offers_card.dart';
import 'package:choco_app/components/product_card.dart';
import 'package:choco_app/components/profile_image.dart';
import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access shop provider
    final shoping = context.watch<CartModule>().shop;
    //access offers provider
    final promo = context.watch<CartModule>().offers;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const ProfileImage(),
                        Gap(20.sp),
                        // user name column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mezu',
                              style: AppText.regular(),
                            ),
                            Text(
                              'Eric',
                              style: AppText.regular(),
                            )
                          ],
                        ),
                      ],
                    ),
                    const CartWidget(),
                  ],
                ),
                Gap(45.sp),
                Text(
                  "Cookies",
                  style: AppText.semiBoldHeader(fontSize: 65.sp),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Premium",
                      style: AppText.regular(
                          color: AppColor.secondary, fontSize: 45.sp),
                    ),
                    Text(
                      "See more",
                      style: AppText.light(
                        color: AppColor.secondary,
                      ),
                    ),
                  ],
                ),
                Gap(30.sp),
                // listviewB for item card
                SizedBox(
                  height: 420.h,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: shoping.length,
                    itemBuilder: (BuildContext context, int index) {
                      // get shop provider index
                      final product = shoping[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 50.sp),
                        child: ProductCard(product: product),
                      );
                    },
                  ),
                ),
                Gap(40.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Offers",
                      style: AppText.semiBoldHeader(fontSize: 70.sp),
                    ),
                    Text(
                      "See more",
                      style: AppText.light(
                        color: AppColor.secondary,
                      ),
                    ),
                  ],
                ),
                Gap(40.sp),

                //ListviewB offers card
                SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                    itemCount: promo.length,
                    itemBuilder: (BuildContext context, int index) {
                      //access offers index
                      final promoproduct = promo[index];
                      return OffersCard(promoproduct: promoproduct);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
