import 'package:choco_app/components/bottombar.dart';
import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/pages/account_page.dart';
import 'package:choco_app/pages/search_page.dart';
import 'package:choco_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // // controlls index for list of pages
  final List<Widget> pages = [
    const ShopPage(),
    const SearchPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // acess provider
    final cartModule = context.watch<CartModule>();
    final selectedindex = cartModule.selectedindex;
    final onItemTapped = cartModule.onItemTapped;

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: selectedindex,
            children: pages,
          )
        ],
      ),
      bottomNavigationBar: BottomBar(
        ontap: onItemTapped,
        currentIndex: selectedindex,
      ),
    );
  }
}
