import 'package:alphatwelve/screens/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/Product.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key, required this.products, required this.productsCategory});

  final List<Product> products;
  final String productsCategory;

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          sliver: SliverToBoxAdapter(
            child: Text(
              widget.productsCategory,
              style: GoogleFonts.ibmPlexMono(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.products.length,
              (context, index) => ProductCard(product: widget.products[index]),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
          ),
        ),
      ],
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     children: [
    //       const Text("Product Category"),
    //       GridView.builder(
    //         itemCount: widget.products.length,
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           mainAxisSpacing: 16,
    //           crossAxisSpacing: 12,
    //           childAspectRatio: 0.70,
    //         ),
    //         itemBuilder: (context, index) {
    //           final product = widget.products[index];
    //           return ProductCard(product: product);
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
