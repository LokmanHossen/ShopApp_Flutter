import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  const CartItems(
      {super.key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Text('৳$price'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: ৳${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
