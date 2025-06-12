
import '../../product/models/Product.dart';
import '../models/cart_item.dart';

class CartController {
  final List<CartItem> _items = [];
  static const double shippingFee = 10.0;

  // Add item to cart or increase quantity if exists
  void addItem(Product product) {
    final existingItemIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex >= 0) {
      _items[existingItemIndex].increaseQuantity();
    } else {
      _items.add(CartItem(product: product));
    }
  }

  // Remove item or decrease quantity
  void removeItem(String productId) {
    final existingItemIndex = _items.indexWhere(
      (item) => item.product.id == productId,
    );

    if (existingItemIndex >= 0) {
      if (_items[existingItemIndex].quantity > 1) {
        _items[existingItemIndex].decreaseQuantity();
      } else {
        _items.removeAt(existingItemIndex);
      }
    }
  }

  // Delete item
  void deleteItem(String productId) {
    final existingItemIndex = _items.indexWhere(
      (item) => item.product.id == productId,
    );
    if (existingItemIndex >= 0) {
      _items.removeAt(existingItemIndex);
    }
  }

  // Calculate subtotal
  double get subtotal => _items.fold(0, (sum, item) => sum + item.totalPrice);

  // Calculate total with shipping
  double get total => _items.isEmpty ? 0 : subtotal + shippingFee;

  // Get all items
  List<CartItem> get items => List.unmodifiable(_items);
}
