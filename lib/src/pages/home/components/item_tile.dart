import 'package:flutter/material.dart';
import 'package:onlydigital/src/config/custom_colors.dart';
import 'package:onlydigital/src/models/item_model.dart';
import 'package:onlydigital/src/pages/product/product_screen.dart';
import 'package:onlydigital/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({
    super.key,
    required this.item,
  });

  final ItemModel item;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // content
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(
                item: item,
              );
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Image
                    Expanded(
                      child: Hero(
                        tag: item.imgUrl,
                        child: Image.asset(
                          item.imgUrl,
                        ),
                      ),
                    ),
                    //Name
                    Text(
                      item.itemName,
                      style: const TextStyle(
                        fontFamily: 'Questrial',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //Price - Unit
                    Row(
                      children: [
                        Text(
                          utilsServices.priceToCurrency(item.price),
                          style: const TextStyle(
                            fontFamily: 'Teko',
                            fontSize: 20,
                          ),
                        ),
                        Text('/${item.unit}')
                      ],
                    )
                  ]),
            ),
          ),
        ),
        // add to the cart
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(12)),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
