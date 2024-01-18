import 'package:flutter/material.dart';
import 'package:onlydigital/src/config/custom_colors.dart';
import 'package:onlydigital/src/pages/cart/cart_tab.dart';
import 'package:onlydigital/src/pages/home/home_tab.dart';
import 'package:onlydigital/src/pages/orders/orders_tab.dart';
import 'package:onlydigital/src/pages/settings/settings.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics:const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTab(),
          OrdersTab(),
          CartTab(),
          Settings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: CustomColors.customSwatchColor.shade700,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_suggest),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
