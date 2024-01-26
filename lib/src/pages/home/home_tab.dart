import 'package:flutter/material.dart';
import 'package:onlydigital/src/config/custom_colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:onlydigital/src/pages/home/components/category_tile.dart';
import 'package:onlydigital/src/config/app_data.dart' as app_data;
import 'package:onlydigital/src/pages/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Prints';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Teko',
              ),
              children: [
                TextSpan(
                  text: 'Only',
                  style: TextStyle(
                    color: CustomColors.customSwatchColor,
                  ),
                ),
                const TextSpan(
                  text: 'Digital',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: GestureDetector(
              onTap: () {},
              child: badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.white,
                ),
                badgeContent: const Text(
                  '2',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: CustomColors.customSwatchColor,
                  size: 24,
                ),
              ),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          //Search bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 24,
                ),
                hintText: 'What are you looking for?',
                hintStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'OpenSans'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
          ),
          //Categorias
          Container(
            padding: const EdgeInsets.only(left: 22, bottom: 8),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  onPressed: () {
                    setState(() {
                      selectedCategory = app_data.categories[index];
                    });
                  },
                  category: app_data.categories[index],
                  isSelected: app_data.categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: app_data.categories.length,
            ),
          ),

          //Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: app_data.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: app_data.items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
