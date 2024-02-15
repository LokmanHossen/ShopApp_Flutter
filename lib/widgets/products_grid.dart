import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  const ProductsGrid(this.showFavs, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final productsProvider =
        showFavs ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      // physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        // create: (context) => productsProvider[index],
        value: productsProvider[index],
        child: const ProductItem(
            //   id: productsProvider[index].id,
            //   title: productsProvider[index].title,
            //   imageUrl: productsProvider[index].imageUrl,
            ),
      ),
      itemCount: productsProvider.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
      ),
    );
  }
}
