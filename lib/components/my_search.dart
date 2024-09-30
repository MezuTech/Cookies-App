import 'package:choco_app/modules/cart_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.cancel),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
        // Close without returning a value
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchQuery = query.toLowerCase();
    final productProvider = context.read<CartModule>();
    final filteredProducts = productProvider.searchProducts(searchQuery);

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];

        // Display product details (name, image, price, etc.) here
        return ListTile(
          title: Text(product.productname + " " + product.productname2),
          // ... other product details
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchQuery = query.toLowerCase();
    final productProvider = context.read<CartModule>();
    final filteredProducts = productProvider.searchProducts(searchQuery);

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];

        // Display product details (name, image, price, etc.) here
        return ListTile(
          title: Text(product.productname + " " + product.productname2),
          // ... other product details
        );
      },
    );
  }
}
