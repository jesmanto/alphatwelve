import 'package:alphatwelve/cart/screens/widgets/cart_items.dart';
import 'package:alphatwelve/screens/widgets/navigator_pane.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_provider.dart';
import '../../utils.dart';

class Cart extends StatefulWidget {
  const Cart({super.key, required this.scaffoldKey, required this.onBackPressed});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onBackPressed;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      body: Column(
        children: [
          NavigationPane(
            title: 'Your Cart',
            callback: () {
              widget.onBackPressed;
            },
          ),
          Expanded(child: CartItems(products: products)),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Consumer<CartProvider>(
          builder: (BuildContext context, cartProvider, Widget? child) {
            final cart = cartProvider.cart;
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff60b5ff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Checkout (\$${cart.total})',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
