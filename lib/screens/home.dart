import 'package:alphatwelve/screens/widgets/custom_app_bar.dart';
import 'package:alphatwelve/screens/widgets/delivery_address_widget.dart';
import 'package:alphatwelve/screens/widgets/navigator_pane.dart';
import 'package:alphatwelve/screens/widgets/products_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final products = [
    Product(
      id: '1',
      name: 'Apple iPhone 16',
      description: '128GB | Teal',
      imageUrl:
          'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product1_m9lhwk.png',
      price: '\$700.00',
    ),
    Product(
      id: '2',
      name: 'M4 Macbook Air 13”',
      description: '256GB | Sky Blue',
      imageUrl:
          'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product2_x9ygc6.png',
      price: '\$1000.00',
    ),
    Product(
      id: '2',
      name: 'Google Pixel 9A',
      description: '128GB|Iris',
      imageUrl:
          'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product4_zotpot.png',
      price: '\$499.00',
    ),
    Product(
      id: '2',
      name: 'Apple Airpods 4',
      description: 'Active Noise Cancellation',
      imageUrl:
          'https://res.cloudinary.com/jesmanto/image/upload/v1749131959/product3_m5i6et.png',
      price: '\$129.00',
    ),
    Product(
      id: '1',
      name: 'Apple iPhone 16',
      description: '128GB | Teal',
      imageUrl:
      'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product1_m9lhwk.png',
      price: '\$700.00',
    ),
    Product(
      id: '1',
      name: 'Apple iPhone 16',
      description: '128GB | Teal',
      imageUrl:
      'https://res.cloudinary.com/jesmanto/image/upload/v1749131960/product1_m9lhwk.png',
      price: '\$700.00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 2),
            NavigationPane(),
            Expanded(child: ProductsList(products: products)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profile'),
        ],
      ),
    );
  }
}
