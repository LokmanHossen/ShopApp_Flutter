import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Amount', style: TextStyle(fontSize: 16)),
                  Chip(
                    // label: Text(cart.totalAmount),
                    label: Text('৳${cart.totalAmount.toStringAsFixed(2)}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text('ORDER NOW'),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.item.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemCount: cart.item.length,
            itemBuilder: (context, index) => CartItems(
              id: cart.item.values.toList()[index].id,
              productId: cart.item.keys.toList()[index],
              price: cart.item.values.toList()[index].price,
              quantity: cart.item.values.toList()[index].quantity,
              title: cart.item.values.toList()[index].title,
            ),
          ))
        ],
      ),
    );
  }
}
