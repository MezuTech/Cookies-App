import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/pages/cart_page.dart';
import 'package:choco_app/pages/home.dart';
import 'package:choco_app/pages/intro_page.dart';
import 'package:choco_app/pages/account_page.dart';
import 'package:choco_app/pages/payment_page.dart';
import 'package:choco_app/pages/search_page.dart';
import 'package:choco_app/pages/shop_page.dart';
import 'package:choco_app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModule(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1520),
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'cookies app',
        theme: ThemeData(
          fontFamily: "Outfit",
          scaffoldBackgroundColor: AppColor.primary,
          brightness: Brightness.dark,
          useMaterial3: false,
        ),
        routes: {
          "/": (context) => const IntroPage(),
          "/home": (context) => HomePage(),
          "/cart": (context) => const CartPage(),
          "/account": (context) => const AccountPage(),
          "/search": (context) => const SearchPage(),
          "/shop": (context) => const ShopPage(),
          "/premibottombarum": (context) => const BottomAppBar(),
          "/payment": (context) => const PaymentPage(),
        },
        initialRoute: "/",
      ),
    );
  }
}
