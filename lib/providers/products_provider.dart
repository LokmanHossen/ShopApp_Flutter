import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

import 'product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
    // Product(
    //   id: 'p5',
    //   title: 'Head Phone',
    //   description: 'That is very Expensiv Headphone',
    //   price: 499.99,
    //   imageUrl:
    //       'https://i.rtings.com/assets/pages/1OCszFAw/best-apple-20230425-medium.jpg',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'Laptop',
    //   description: 'That is very Expensiv Laptop',
    //   price: 499.99,
    //   imageUrl:
    //       'https://cdn.techjuice.pk/wp-content/uploads/2022/09/laptop.png',
    // ),
    // Product(
    //   id: 'p7',
    //   title: 'Mobile Phone',
    //   description: 'old-mobile-phones',
    //   price: 1499.99,
    //   imageUrl:
    //       'https://as1.ftcdn.net/v2/jpg/00/39/51/70/1000_F_39517018_sNPAc84XFW89zxxHyo8kkh168yDbWBKE.jpg',
    // ),
    // Product(
    //   id: 'p8',
    //   title: 'Gaming Desk',
    //   description:
    //       'Gaming Desk 44.5 inch Z Shaped Home Office Workstation PC Computer Gamer Table with RGB LED Lights Mouse Pad Handle Rack Cup Holder Headphone Hook, Black',
    //   price: 499.99,
    //   imageUrl:
    //       'https://images-cdn.ubuy.qa/6359b8fb958f37712c0b171e-it-39-s-organized-47-inch-gaming-desk.jpg',
    // ),
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
  Future<void> fetchAndProducts() async {
    final url = Uri.parse(
        'https://shopapp-e2bd2-default-rtdb.firebaseio.com/products.json');
    try {
      final response = await http.get(url);
      // print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProduct = [];
      extractedData.forEach((prodId, prodData) {
        loadedProduct.add(
          Product(
              id: prodId,
              title: prodData['title'],
              description: prodData['description'],
              imageUrl: prodData['imageUrl'],
              price: prodData['price'],
              isFavorite: prodData['isFavorite']),
        );
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addProduct(Product product) async {
    // var url = 'https://shopapp-e2bd2-default-rtdb.firebaseio.com/products.json';
    final url = Uri.https(
        'shopapp-e2bd2-default-rtdb.firebaseio.com', '/products.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        }),
      );
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); //at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
    // .then((response) {
    // print(json.decode(response.body));
    // _items.add(value);

    // .catchError((error) {
    //   print(error);
    //   throw error;
    // // });
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final productIndex = _items.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      final url = Uri.https(
          'shopapp-e2bd2-default-rtdb.firebaseio.com', '/products/$id.json');
      await http.patch(
        url,
        body: json.encode({
          'title': newProduct.title,
          'description': newProduct.description,
          'imageUrl': newProduct.imageUrl,
          'price': newProduct.price,
          // 'isFavorite': newProduct.isFavorite,
        }),
      );
      _items[productIndex] = newProduct;
      notifyListeners();
    } else {
      // print('....');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
        Uri.https('shopapp-e2bd2-default-rtdb.firebaseio.com', '/products/$id.json');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    Product? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    // _items.removeWhere((prod) => prod.id == id);
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
