import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/modules/product_module.dart';
import 'package:choco_app/themes/app_text.dart';

import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final Products myproduct;
  final void Function()? onPlusTap;
  final void Function()? onMinusTap;

  const CartTile({
    super.key,
    required this.myproduct,
    required this.onMinusTap,
    required this.onPlusTap,
  });
// dialogue method to remove item from cart
  void removeItemincart(
    BuildContext context,
    Products product,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Remove Item",
          style: AppText.regular(),
        ),
        content: Text(
          "Are you sure you want to remove this item from your cart?",
          style: AppText.regular(),
        ),
        actions: [
          //cancel button
          Padding(
            padding: EdgeInsets.all(20.sp),
            child: MaterialButton(
              padding: EdgeInsets.all(15.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              color: AppColor.secondary,
              child: Text(
                "Cancel",
                style: AppText.regular(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          //remove button
          Padding(
            padding: EdgeInsets.all(20.sp),
            child: MaterialButton(
              padding: EdgeInsets.all(15.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              color: AppColor.secondary,
              child: Text(
                "Remove",
                style: AppText.regular(),
              ),
              onPressed: () {
                Provider.of<CartModule>(context, listen: false)
                    .removeProduct(myproduct);
                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    closeIconColor: Colors.black,
                    behavior: SnackBarBehavior.floating,
                    showCloseIcon: true,
                    content: Text(
                      "Item successfully removed from cart",
                      style: AppText.regular(fontSize: 30.sp),
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
      margin: EdgeInsets.only(bottom: 20.sp),
      width: double.infinity,
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColor.primarylite,
      ),
      child: Column(
        children: [
          Row(
            children: [
              //product image
              Container(
                color: Colors.transparent,
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  myproduct.productnameimage,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(16.h),
              // name and price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${myproduct.productname} ${myproduct.productname2}",
                    style: AppText.regular(),
                  ),
                  Gap(10.h),
                  Text(
                    "\$${myproduct.promoprice ?? myproduct.price.toString()}",
                    style: AppText.boldHeader(),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          // remove and qantity counter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  removeItemincart(context, myproduct);
                },
                child: Text(
                  "Remove",
                  style: AppText.light(color: AppColor.secondary, fontSize: 20),
                ),
              ),
              // counter row
              Row(
                children: [
                  // minus button
                  GestureDetector(
                    onTap: onMinusTap,
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColor.secondary,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          size: 35.h,
                        ),
                      ),
                    ),
                  ),
                  Gap(30.h),
                  Text(
                    myproduct.quantity.toString(),
                    style: AppText.light(),
                  ),
                  Gap(30.h),
                  // plus icon
                  GestureDetector(
                    onTap: onPlusTap,
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColor.secondary,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 35.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
