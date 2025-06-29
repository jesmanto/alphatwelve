import 'package:alphatwelve/product/screens/single_product_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/Product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SingleProductPage(widget.product)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              height: 150,
              child: CachedNetworkImage(
                imageUrl: widget.product.imageUrl,
                placeholder: (context, url) =>
                const Center(
                  child: CircularProgressIndicator(strokeWidth: 2,),
                ),
                errorWidget:
                    (context, error, stackTrace) =>
                const Icon(
                  Icons.broken_image,
                  size: 48,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            widget.product.name,
            style: TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.product.description,
            style: TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2),
          Text(
            '\$${widget.product.price}',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
