import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  // final String title;
  // final String price;

  // const ProductDetailsScreen({super.key, required this.title, required this.price});
  static const routeName = '/po=roduct-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
    );
  }
}
