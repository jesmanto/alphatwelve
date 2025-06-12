import 'package:alphatwelve/cart/controllers/cart_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item.dart';

class CartViewItem extends StatefulWidget {
  const CartViewItem({super.key, required this.item});

  final CartItem item;

  @override
  State<CartViewItem> createState() => _CartViewItemState();
}

class _CartViewItemState extends State<CartViewItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F5F8),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          CachedNetworkImage(imageUrl: widget.item.product.imageUrl),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.item.product.name} ${widget.item.product.description}",
                  maxLines: 2,
                ),
                Text(
                  '\$${widget.item.product.price}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Text('In stock', style: TextStyle(color: Color(0xff10b981))),
                Consumer<CartProvider>(
                  builder:
                      (
                        BuildContext context,
                        CartProvider value,
                        Widget? child,
                      ) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   if (quantity > 1) {
                                //     quantity--;
                                //   }
                                // });
                                value.removeFromCart(widget.item.product.id);
                              },
                              child: Icon(Icons.remove, color: Colors.black),
                            ),
                          ),
                          Text('${widget.item.quantity}'),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              child: Icon(Icons.add, color: Color(0xff334155)),
                              onTap: () {
                                // setState(() {
                                //   quantity++;
                                // });
                                value.addToCart(widget.item.product);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                value.deleteItem(widget.item.product.id);
                              },
                              child: SvgPicture.asset(
                                'assets/icons/delete_icon.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
