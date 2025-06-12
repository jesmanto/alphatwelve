import 'package:alphatwelve/product/screens/products_page.dart';
import 'package:alphatwelve/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cart/screens/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<GlobalKey<ScaffoldState>> _scaffoldKeys = [
    GlobalKey<ScaffoldState>(),
    GlobalKey<ScaffoldState>(),
    GlobalKey<ScaffoldState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          _handleScreenBack(_selectedIndex);
        }
      },
      child: Scaffold(
        appBar: _appBar(),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            ProductsPage(
              scaffoldKey: _scaffoldKeys[0],
              onBackPressed: () => _handleScreenBack(0),
            ),
            Cart(
              scaffoldKey: _scaffoldKeys[1],
              onBackPressed: () => _handleScreenBack(1),
            ),
            ProductsPage(
              scaffoldKey: _scaffoldKeys[2],
              onBackPressed: () => _handleScreenBack(2),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavIcon('assets/icons/home_icon.svg', 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon('assets/icons/cart_icon.svg', 1),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon('assets/icons/favourite_icon.svg', 2),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(('assets/icons/profile_icon.svg'), 3),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavIcon(String icon, int index) {
    bool isActive = _selectedIndex == index;
    return Container(
      padding:
          index == 0
              ? EdgeInsets.symmetric(horizontal: 16, vertical: 4)
              : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: SvgPicture.asset(
        icon,
        color: isActive ? Colors.white : Colors.black,
      ),
    );
  }

  void _handleScreenBack(int screenIndex) {
    if (screenIndex == 0) {
      if (_selectedIndex != 0) {
        setState(() => _selectedIndex = 0);
      }
    } else {
      setState(() => _selectedIndex = 0);
    }
  }

  PreferredSizeWidget _appBar() {
    switch (_selectedIndex) {
      case 0:
        return CustomAppBar(includeSearch: true);
      default:
        return CustomAppBar(includeSearch: false);
    }
  }
}
