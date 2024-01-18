import 'package:flutter/material.dart';
import 'package:onlydigital/src/config/custom_colors.dart';
import 'package:onlydigital/src/models/cart_item_model.dart';
import 'package:onlydigital/src/pages/cart/components/cart_tile.dart';
import 'package:onlydigital/src/services/utils_services.dart';
import 'package:onlydigital/src/config/app_data.dart' as app_data;

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0.0;

    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      // Appbar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade400,
        shadowColor: Colors.grey.shade900,
        elevation: 1,
        title: const Text(
          'Your OnlyDigital Cart',
          style: TextStyle(
            fontFamily: 'Teko',
            fontSize: 32,
          ),
        ),
      ),

      //Content
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: app_data.cartItems.length,
              itemBuilder: (_, index) {
                return CartTile(
                  cartItem: app_data.cartItems[index],
                  remove: removeItemFromCart,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            height: 180,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ]),

            // Order Total
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Order total:',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Teko',
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: const TextStyle(
                    fontFamily: 'Teko',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                // Button Buy
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      print(result);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: CustomColors.customSwatchColor),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        barrierDismissible: true,
        barrierColor: const Color.fromARGB(110, 0, 0, 0),
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsOverflowButtonSpacing: 0.1,
            backgroundColor: Colors.black,
            surfaceTintColor: Colors.white,
            title: Text(
              'Confirmation',
              style: TextStyle(
                color: CustomColors.customSwatchColor,
                fontFamily: 'Questrial',
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              'Do you really want to complete the order?',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'OpenSans',
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  // return false
                },
                child: const Text(
                  'No, thank you',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  //return true
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.customSwatchColor,
                ),
                child: const Text(
                  'Yes, I Want Now!!',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          );
        });
  }
}
