import 'package:flutter/material.dart';
import 'package:restaurant_app/constants/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({ Key? key }) : super(key: key);

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

  // void buildPage(){
  //   buildPage({
  //     required image, 
  //     required title,
  //     required subtitle,
  //     required onPress,
  //     required textButton
  //   })
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            color: bgColor,
            child: Column(
              children: [
                Image.asset("assets/images/onboarding-1.png"),
                Text(
                  "Restaurant\nRecommendation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Don't know where to eat?\nWe'll suggest best restaurant\nfor you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    effect: WormEffect(
                      spacing: 16,
                      dotColor: Colors.black54,
                      activeDotColor: yellowColor,
                    ),
                    onDotClicked: (index) => controller.animateToPage(
                      index, 
                      duration: Duration(milliseconds: 500), 
                      curve: Curves.easeIn
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: orangeColor,
                      onPrimary: Colors.white,
                      shape: StadiumBorder()
                    ),
                    onPressed: () => controller.nextPage(
                      duration: Duration(milliseconds: 500), 
                      curve: Curves.easeInOut
                    ), 
                    child: Text("NEXT", style: TextStyle(fontWeight: FontWeight.bold),)
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 80),
            color: Colors.red,
            child: Center(child: Text("Page 2")),
          ),
        ],
      ),
    );
  }
}
