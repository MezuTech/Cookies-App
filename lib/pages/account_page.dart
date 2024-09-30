import 'package:choco_app/components/cart_fab.dart';
import 'package:choco_app/components/my_appbar.dart';
import 'package:choco_app/modules/account_props.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myprop = MyProp();
    final propList = myprop.accountProp.values.toList();

    final settingsList = myprop.accountSetting.values.toList();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const CartFab(),
        appBar: const MyAppbar(),
        body: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(18.h),
                child: Text(
                  "MY CHOCO ACCOUNT",
                  style: AppText.light(fontSize: 20),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(20.h),
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColor.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: propList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final userProp = propList[index];
                    return ListTile(
                      iconColor: AppColor.black,
                      textColor: AppColor.black,
                      title: Text(userProp.text),
                      leading: userProp.leading,
                      trailing: userProp.trailing,
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(18.h),
                child: Text(
                  "MY SETTINGS",
                  style: AppText.light(fontSize: 20),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20.h),
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColor.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: settingsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final userSet = settingsList[index];
                    return ListTile(
                      iconColor: AppColor.black,
                      textColor: AppColor.black,
                      title: Text(userSet.text),
                      trailing: userSet.trailing,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.h),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "LOGOUT",
                  style: AppText.regular(color: AppColor.secondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
