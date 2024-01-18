import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(255, 213, 78, .1),
  100: const Color.fromRGBO(255, 213, 78, .2),
  200: const Color.fromRGBO(255, 213, 78, .3),
  300: const Color.fromRGBO(255, 213, 78, .4),
  400: const Color.fromRGBO(255, 213, 78, .5),
  500: const Color.fromRGBO(255, 213, 78, .6),
  600: const Color.fromRGBO(255, 213, 78, .7),
  700: const Color.fromRGBO(255, 213, 78, .8),
  800: const Color.fromRGBO(255, 213, 78, .9),
  900: const Color.fromRGBO(255, 213, 78, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.amber;

  static MaterialColor customSwatchColor =
      MaterialColor(0xFFFFD54E, _swatchOpacity);
}
