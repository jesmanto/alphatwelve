import '../../product/models/Product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  double get totalPrice => product.price * quantity;
}
