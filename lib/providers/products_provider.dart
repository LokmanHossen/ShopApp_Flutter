import 'package:flutter/material.dart';

import 'product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Head Phone',
      description: 'That is very Expensiv Headphone',
      price: 499.99,
      imageUrl:
          'https://i.rtings.com/assets/pages/1OCszFAw/best-apple-20230425-medium.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Laptop',
      description: 'That is very Expensiv Laptop',
      price: 499.99,
      imageUrl:
          'https://cdn.techjuice.pk/wp-content/uploads/2022/09/laptop.png',
    ),
    Product(
      id: 'p7',
      title: 'Mobile Phone',
      description: 'old-mobile-phones',
      price: 1499.99,
      imageUrl:
          'https://as1.ftcdn.net/v2/jpg/00/39/51/70/1000_F_39517018_sNPAc84XFW89zxxHyo8kkh168yDbWBKE.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Gaming Desk',
      description:
          'Gaming Desk 44.5 inch Z Shaped Home Office Workstation PC Computer Gamer Table with RGB LED Lights Mouse Pad Handle Rack Cup Holder Headphone Hook, Black',
      price: 499.99,
      imageUrl:
          'https://images-cdn.ubuy.qa/6359b8fb958f37712c0b171e-it-39-s-organized-47-inch-gaming-desk.jpg',
    ),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // @override
  // void dispose() {

  //   super.dispose();
  // }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    // _items.add(value);
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct); //at the start of the list
    notifyListeners();
  }
}
