import 'package:flutter/material.dart';

const Color bgColor =  Color(0xFFF2F2F2);
const Color orangeColor =  Color(0xFFE55834);
const Color yellowColor =  Color(0xFFF5BB01);

final purple = Colors.purple;
final red =Colors.red;
final orange = Colors.orange;
final amber = Colors.amber;
final blue = Colors.blue;
final green = Colors.green;
final lightBlue = Colors.lightBlue;
final lightGreen = Colors.lightGreen;
final pink = Colors.pink;
final teal = Colors.teal;
final cyan = Colors.cyan;

List<Color> colorList = [
  purple,
  red,
  orange,
  amber,
  blue,
  green,
  lightBlue,
  lightGreen,
  pink,
  teal,
  cyan
];

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}