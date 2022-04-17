import 'package:flutter/material.dart';
import "dart:math";

const Color bgColor =  Color(0xFFF2F2F2);
const Color orangeColor =  Color(0xFFE55834);
const Color yellowColor =  Color(0xFFF5BB01);

final purple = Colors.purple.value.toRadixString(16);
final red =Colors.red.value.toRadixString(16);
final orange = Colors.orange.value.toRadixString(16);
final amber = Colors.amber.value.toRadixString(16);
final blue = Colors.blue.value.toRadixString(16);
final green = Colors.green.value.toRadixString(16);
final lightBlue = Colors.lightBlue.value.toRadixString(16);
final lightGreen = Colors.lightGreen.value.toRadixString(16);
final pink = Colors.pink.value.toRadixString(16);
final teal = Colors.teal.value.toRadixString(16);
final cyan = Colors.cyan.value.toRadixString(16);

var colorList = [
  HexColor(purple),
  HexColor(red),
  HexColor(orange),
  HexColor(amber),
  HexColor(blue),
  HexColor(green),
  HexColor(lightBlue),
  HexColor(lightGreen),
  HexColor(pink),
  HexColor(teal),
  HexColor(cyan)
];

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}