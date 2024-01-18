import 'package:flutter/material.dart';
import 'package:onlydigital/src/config/custom_colors.dart';
import 'package:onlydigital/src/models/cart_item_model.dart';
import 'package:onlydigital/src/pages/common_widgets/quantity_widget.dart';
import 'package:onlydigital/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({
    super.key,
    required this.cartItem,
    required this.remove,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      color: CustomColors.customSwatchColor,
      child: ListTile(
        // Image
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          width: 60,
          height: 60,
        ),
        //Title
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontFamily: 'Questrial',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: const TextStyle(fontFamily: 'Teko', fontSize: 24),
        ),

        // Button Quantity
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;

              if (quantity == 0) {
                //remove item cart
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
