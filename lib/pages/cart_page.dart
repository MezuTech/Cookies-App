import 'package:choco_app/components/cart_tile.dart';
import 'package:choco_app/components/checkout_button.dart';
import 'package:choco_app/components/my_popupmenu_button.dart';
import 'package:choco_app/modules/cart_module.dart';
import 'package:choco_app/pages/home.dart';
import 'package:choco_app/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    // access cart and total price provider
    final mycart = context.watch<CartModule>().cart;
    final itemcount = context.read<CartModule>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        backgroundColor: Colors.black45,
        title: Text(
          "Cart",
          style: AppText.regular(),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyPopupmenuButton(
                      onTap: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      icon: Icons.home_outlined,
                      title: 'Home',
                    ),
                    MyPopupmenuButton(
                        onTap: () {
                          Navigator.pushNamed(context, "/account");
                        },
                        icon: Icons.manage_accounts_outlined,
                        title: 'Account'),
                    MyPopupmenuButton(
                        onTap: () {
                          Navigator.pushNamed(context, "/account");
                        },
                        icon: Icons.help_outline,
                        title: 'Help'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body:
          // check if cart is empty
          mycart.isEmpty
              ? Center(
                  child: Text(
                    "Your cart is empty!",
                    style: AppText.boldHeader(),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: mycart.length,
                        itemBuilder: (BuildContext context, int index) {
                          //get cart index
                          final usercart = mycart[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CartTile(
                              myproduct: usercart,
                              onMinusTap: () {
                                itemcount.reduceItemQuantity(index);
                              },
                              onPlusTap: () {
                                itemcount.increaseItemQuantity(index);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
      bottomNavigationBar: mycart.isEmpty ? null : const CheckoutButton(),
    );
  }
}
