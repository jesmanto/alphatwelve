import 'package:alphatwelve/cart/controllers/cart_provider.dart';
import 'package:alphatwelve/product/screens/widgets/product_image.dart';
import 'package:alphatwelve/screens/widgets/custom_app_bar.dart';
import 'package:alphatwelve/screens/widgets/navigator_pane.dart';
import 'package:alphatwelve/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Product.dart';

class SingleProductPage extends StatefulWidget {
  const SingleProductPage(this.product, {super.key});

  final Product product;

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  final List<String> bulletItems = [
    "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.",
    "There will be no visible cosmetic imperfections when held at an arm’s length.",
    "There will be no visible cosmetic imperfections when held at an arm’s length.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(includeSearch: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationPane(
                title: 'Go back',
                callback: Navigator.of(context).pop,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductImage(imageUrl: widget.product.imageUrl),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.product.name,
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '\$${widget.product.price}',
                  style: TextStyle(
                    fontSize: 32.75,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'About this item',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff999999),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bulletItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) => _bulletText(bulletItems[i]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Consumer<CartProvider>(
          builder:
              (BuildContext context, cartProvider, Widget? child) => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    cartProvider.addToCart(widget.product);
                    showCustomToast(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff60b5ff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Widget _bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: Color(0xff999999)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Color(0xff999999)),
            ),
          ),
        ],
      ),
    );
  }
}
