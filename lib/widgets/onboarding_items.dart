import 'package:flutter/material.dart';
import '../common/color.dart';
import '../screens/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnboardingItems extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  String textButton;
  final PageController controller;

  OnboardingItems({super.key, 
    required this.image, 
    required this.title,
    required this.subtitle,
    required this.textButton,
    required this.controller
  });

  void onPress(context){
    (textButton == "Next")
      ? controller.nextPage(
          duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut
        )
      : Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen()
          )
        )
      ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(height: 40),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ), 
            const SizedBox(height: 40),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: const WormEffect(
                  spacing: 16,
                  dotColor: Colors.black54,
                  activeDotColor: yellowColor,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: orangeColor,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder()),
                  onPressed: () => onPress(context),
                  child: Text(
                    textButton,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold, 
                      color: Colors.white
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
