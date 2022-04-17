import 'package:flutter/material.dart';
import "dart:math";

const Color bgColor =  Color(0xFFF2F2F2);
const Color orangeColor =  Color(0xFFE55834);
const Color yellowColor =  Color(0xFFF5BB01);

var colorList = [
  Colors.purple,
  Colors.red,
  Colors.orange,
  Colors.amber,
  Colors.blue,
  Colors.green,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
];

final _random = Random();
var color = colorList[_random.nextInt(colorList.length)];