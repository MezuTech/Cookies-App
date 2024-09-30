import 'package:choco_app/components/logo_card.dart';
import 'package:choco_app/components/my_textfield.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Icon(
                  Icons.lock,
                  size: 200.h,
                  color: AppColor.white,
                ),
                Gap(40.h),
                Text(
                  "Welcome! Login",
                  style: AppText.boldHeader(fontSize: 60.sp),
                ),
                const Spacer(),
                MyTextfield(
                  obscuretext: false,
                  hintText: "Email",
                ),
                const Gap(10),
                MyTextfield(
                  obscuretext: true,
                  hintText: "Password",
                ),
                Gap(20.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forgot Password?",
                    style: AppText.light(color: AppColor.grey),
                  ),
                ),
                Gap(40.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                  child: Container(
                    height: 100.h,
                    margin: EdgeInsets.symmetric(vertical: 40.sp),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: AppText.boldHeader(
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColor.primarylite,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: const Text(
                        "Or continue with",
                        style: TextStyle(color: AppColor.grey),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColor.primarylite,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoCard(imagePath: "assets/images/google.png"),
                    LogoCard(imagePath: "assets/images/apple.png"),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
