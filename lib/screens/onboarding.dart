import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/onboarding_items.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({ super.key });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            OnboardingItems(
              image: "assets/images/onboarding-1.png",
              title: "Restaurant\nRecommendation", 
              subtitle: "Don't know where to eat?\nWe'll suggest best restaurant\nfor you!",
              textButton: "Next",
              controller: controller
            ),
            OnboardingItems(
              image: "assets/images/onboarding-2.png",
              title: "Detail\nRestaurants", 
              subtitle: "You can see the detail\neach of the restaurants\n ",
              textButton: "Get Started",
              controller: controller
            ),
          ],
        ),
      ),
    );
  }
}
