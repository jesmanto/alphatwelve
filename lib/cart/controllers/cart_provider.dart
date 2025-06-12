import 'package:alphatwelve/cart/controllers/cart_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../product/models/Product.dart';

class CartProvider with ChangeNotifier {
  final CartController _cartController = CartController();

  CartController get cart => _cartController;

  void addToCart(Product product) {
    _cartController.addItem(product);
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cartController.removeItem(productId);
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartController.deleteItem(productId);
    notifyListeners();
  }
}