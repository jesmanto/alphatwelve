import 'package:alphatwelve/product/screens/widgets/products_list.dart';
import 'package:alphatwelve/screens/widgets/navigator_pane.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.scaffoldKey, required this.onBackPressed});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onBackPressed;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          NavigationPane(title: "Technology"),
          Expanded(
            child: ProductsList(
              products: products,
              productsCategory: 'Smartphones, Laptops & Accessories',
            ),
          ),
        ],
      ),
    );
  }
}
