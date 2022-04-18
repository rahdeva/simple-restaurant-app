import 'package:flutter/material.dart';
import 'package:restaurant_app/constants/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingItems extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  String textButton;
  Function onPress;
  PageController controller;

  OnboardingItems({Key? key, 
    required this.image, 
    required this.title,
    required this.subtitle,
    required this.onPress,
    required this.textButton,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      color: bgColor,
      child: Column(
        children: [
          Image.asset(image),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ), 
          const SizedBox(height: 40),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
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
                    primary: orangeColor,
                    onPrimary: Colors.white,
                    shape: const StadiumBorder()),
                onPressed: (){},
                child: Text(
                  textButton,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                )
            ),
          ),
        ],
      ),
    );
  }
}
