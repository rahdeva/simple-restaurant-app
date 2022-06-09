import 'package:flutter/material.dart';
import 'package:restaurant_app/common/color.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFF6B38FB);
const Color darkPrimaryColor = Color(0xFF000000);
const Color darkSecondaryColor = Color(0xff64ffda);

ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: Colors.black,
        secondary: secondaryColor,
      ),
  scaffoldBackgroundColor: bgColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: orangeColor,
    unselectedItemColor: Colors.grey,
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     primary: secondaryColor,
  //     onPrimary: Colors.white,
  //     textStyle: const TextStyle(),
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(0),
  //       ),
  //     ),
  //   ),
  // ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: darkPrimaryColor,
        onPrimary: Colors.black,
        secondary: darkSecondaryColor,
      ),
  // scaffoldBackgroundColor: Colors.black,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: orangeColor,
    unselectedItemColor: Colors.grey,
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     primary: secondaryColor,
  //     onPrimary: Colors.white,
  //     textStyle: TextStyle(),
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(0),
  //       ),
  //     ),
  //   ),
  // ),
);
