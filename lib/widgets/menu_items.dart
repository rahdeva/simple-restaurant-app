import 'dart:math';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/resto_detail.dart';
import '../common/color.dart';

class MenuItems extends StatelessWidget {
  final List<Category> menu; 

  const MenuItems({super.key, required this.menu});

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
                  colors.withValues(alpha: 0.7),
                  colors,
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 6.0),
              child: Text(
                menu[i].name!,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              )
            ),
          );
        }
      ),
    );
  }
}
