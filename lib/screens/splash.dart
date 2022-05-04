import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/color.dart';
import 'package:restaurant_app/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const OnboardingScreen()
      ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
