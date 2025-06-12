import 'package:alphatwelve/product/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final products = [
  Product(
    id: '1',
    name: 'Apple iPhone 16',
    description: '128GB | Teal',
    imageUrl:
        'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product1_m9lhwk.png',
    price: 700.00,
  ),
  Product(
    id: '2',
    name: 'M4 Macbook Air 13”',
    description: '256GB | Sky Blue',
    imageUrl:
        'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product2_x9ygc6.png',
    price: 1000.00,
  ),
  Product(
    id: '3',
    name: 'Google Pixel 9A',
    description: '128GB|Iris',
    imageUrl:
        'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product4_zotpot.png',
    price: 499.00,
  ),
  Product(
    id: '4',
    name: 'Apple Airpods 4',
    description: 'Active Noise Cancellation',
    imageUrl:
        'https://res.cloudinary.com/jesmanto/image/upload/v1749131959/product3_m5i6et.png',
    price: 129.00,
  ),
  Product(
    id: '1',
    name: 'Apple iPhone 16',
    description: '128GB | Teal',
    imageUrl:
        'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product1_m9lhwk.png',
    price: 700.00,
  ),
  Product(
    id: '1',
    name: 'Apple iPhone 16',
    description: '128GB | Teal',
    imageUrl:
        'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product1_m9lhwk.png',
    price: 700.00,
  ),
];

void showCustomToast(BuildContext context) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder:
        (context) => Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(.9),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Item has been added to cart",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => entry.remove(),
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
  );

  overlay.insert(entry);
  Future.delayed(Duration(seconds: 3)).then((_) => entry.remove());
}
