import 'dart:math';
import 'package:flutter/material.dart';
import '../common/color.dart';

class MenuItems extends StatelessWidget {
  final List menu; 

  const MenuItems({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 1000, minHeight: 50.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: menu.length,
        itemBuilder: (context, i) {
          final random = Random();
          Color colors = colorList[random.nextInt(colorList.length)];
          return Container(
            margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
            height: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colors.withOpacity(0.7),
                  colors,
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 6.0),
              child: Text(
                menu[i]["name"],
                style: const TextStyle(color: Colors.white),
              )
            ),
          );
        }
      ),
    );
  }
}
