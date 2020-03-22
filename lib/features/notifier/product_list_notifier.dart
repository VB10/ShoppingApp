import 'package:flutter/material.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ProductListNotifier extends ChangeNotifier {
  List<Product> productList = [];

  void addProduct(Product product) {
    productList.add(product);
    notifyListeners();
  }
}
