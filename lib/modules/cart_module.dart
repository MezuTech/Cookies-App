import 'package:choco_app/modules/product_module.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartModule extends ChangeNotifier {
  // List of products for sale
  final List<Products> _shop = [
    Products(
      productname: "Chocolate",
      productname2: "chips",
      productnameimage: "assets/images/cookies.png",
      price: 20,
      quantity: 1,
      id: const Uuid().v4(),
    ),
    Products(
      productname: "Oatmeal",
      productname2: "with rasins",
      productnameimage: "assets/images/cookies.png",
      price: 16,
      quantity: 1,
      id: const Uuid().v4(),
    ),
  ];

  final List<Products> _offers = [
    Products(
      productname: "Double",
      productname2: "chocolate",
      productnameimage: "assets/images/double choco.png",
      price: 20,
      promoprice: 12,
      quantity: 1,
      id: const Uuid().v4(),
    ),
  ];

// Empty cart list
  final List<Products> _cart = [];

// Get products
  List<Products> get shop => _shop;

  // Get cart
  List<Products> get cart => _cart;

  // get offers
  List<Products> get offers => _offers;

  // Method to add products to cart
  void addProductToCart(Products item) {
    try {
      final existingItem = cart.firstWhere((element) => element.id == item.id);
      existingItem.quantity++;
    } catch (e) {
      // If the item is not found, add it to the cart
      _cart.add(item);
      notifyListeners();
    }
  }

  // Method to remove products from cart
  void removeProduct(Products item) {
    _cart.remove(item);
    notifyListeners();
  }

  // item quantity
  void increaseItemQuantity(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  // item quantity
  void reduceItemQuantity(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
      notifyListeners();
    }
  }

  // calculate total price
  double get totalPrice {
    return _cart.fold(
      0.00,
      (sum, product) =>
          sum + ((product.promoprice ?? product.price) * product.quantity),
    );
  }

  List<Products> searchProducts(String query) {
    final combinedProducts = shop + offers;
    return combinedProducts
        .where((product) => (product.productname + product.productname2)
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }
}
