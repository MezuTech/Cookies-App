import 'package:choco_app/components/bottombar.dart';
import 'package:choco_app/pages/account_page.dart';
import 'package:choco_app/pages/search_page.dart';
import 'package:choco_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // controlls index for list of pages
  int selectedindex = 0;

  // method for bottombar tap to navigate
  onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

// list of pages for bottombar
  List pages = [
    const ShopPage(),
    const SearchPage(),
    const AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomBar(
        ontap: onItemTapped,
        currentIndex: selectedindex,
      ),
    );
  }
}
