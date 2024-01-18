import 'package:onlydigital/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });

  // Total price products
  double totalPrice() => item.price * quantity;

  // Total order
}
