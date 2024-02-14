import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({super.key});

  // final List<Product> loadProducts = [

  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('MyShop'),
      ),
      body: const ProductsGrid(),
    );
  }
}
