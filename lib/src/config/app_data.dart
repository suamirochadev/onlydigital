import 'package:onlydigital/src/models/cart_item_model.dart';
import 'package:onlydigital/src/models/item_model.dart';
import 'package:onlydigital/src/models/orders_model.dart';
import 'package:onlydigital/src/models/user_model.dart';

// Category List
List<String> categories = [
  'Prints',
  '3D models',
  'Footage',
  'Planners',
  'Sale'
];

//Product List - Prints
ItemModel girlInRedArt = ItemModel(
  description:
      'A art print refers to a reproduction of a work of art, typically in printed format.',
  imgUrl: 'assets/prints/girl_in_red.jpg',
  itemName: 'A Girl in red Art Print',
  price: 20.70,
  unit: 'unit',
);
ItemModel abstractArt = ItemModel(
  description:
      'A art print refers to a reproduction of a work of art, typically in printed format.',
  imgUrl: 'assets/prints/abstract.jpg',
  itemName: 'Abstract Art Print',
  price: 20.70,
  unit: 'unit',
);
ItemModel flowersArt = ItemModel(
  description:
      'A art print refers to a reproduction of a work of art, typically in printed format.',
  imgUrl: 'assets/prints/flowers.jpg',
  itemName: 'Flowers Art Print',
  price: 20.70,
  unit: 'unit',
);
ItemModel goghSunArt = ItemModel(
  description:
      'A art print refers to a reproduction of a work of art, typically in printed format.',
  imgUrl: 'assets/prints/gogh_sun.jpg',
  itemName: 'Gogh Sun Art Print',
  price: 20.70,
  unit: 'unit',
);
ItemModel monaWithSunArt = ItemModel(
  description:
      'A art print refers to a reproduction of a work of art, typically in printed format.',
  imgUrl: 'assets/prints/mona_with_suns.jpg',
  itemName: 'Mona with Suns Art Print',
  price: 20.70,
  unit: 'unit',
);
ItemModel sunflowerArt = ItemModel(
  description:
      'A art print refers to a reproduction of a work of art, typically in printed format.',
  imgUrl: 'assets/prints/sunflower.jpg',
  itemName: 'Sunflower Art Print',
  price: 20.70,
  unit: 'unit',
);

// Products List - Prints
List<ItemModel> items = [
  girlInRedArt,
  abstractArt,
  flowersArt,
  goghSunArt,
  monaWithSunArt,
  sunflowerArt
];

//Cart List
List<CartItemModel> cartItems = [
  CartItemModel(
    item: girlInRedArt,
    quantity: 2,
  ),
  CartItemModel(
    item: girlInRedArt,
    quantity: 3,
  ),
  CartItemModel(
    item: girlInRedArt,
    quantity: 1,
  ),
];

//Profile
UserModel user = UserModel(
  name: 'Alexandro James',
  email: 'yourmail@mail.com',
  cpf: '##########',
  celphone: '+12 34 5 6789-1011',
  password: '********',
);

// Orders List
List<OrderModel> orders = [
  OrderModel(
    overDueDateTime: DateTime.parse(
        '2022-01-17 10:04:00.321',
      ),
      copyAndPaste: 'iofwfwep23e032',
      createdDateTime: DateTime.parse(
        '2022-01-17 10:04:00.321',
      ),
      id: 'ssmdfksmfd',
      status: 'pending_payment',
      total: 11.0,
      items: [
        CartItemModel(
          item: girlInRedArt,
          quantity: 2,
        ),
        CartItemModel(
          item: abstractArt,
          quantity: 2,
        ),
      ]),
];
