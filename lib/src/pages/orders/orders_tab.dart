import 'package:flutter/material.dart';
import 'package:onlydigital/src/config/app_data.dart' as app_data;
import 'package:onlydigital/src/config/custom_colors.dart';
import 'package:onlydigital/src/pages/orders/components/orders_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.customSwatchColor,
        title: const Text(
          'Orders',
          style: TextStyle(
            fontFamily: 'Teko',
            fontSize: 38,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (_, index) => OrderTile(order: app_data.orders[index]),
        itemCount: app_data.orders.length,
      ),
    );
  }
}
