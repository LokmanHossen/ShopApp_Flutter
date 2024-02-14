import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final productsProvider = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => ProductItem(
        id: productsProvider[index].id,
        title: productsProvider[index].title,
        imageUrl: productsProvider[index].imageUrl,
      ),
      itemCount: productsProvider.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
