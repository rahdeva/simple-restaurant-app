import 'package:flutter/material.dart';
import 'package:restaurant_app/common/themes.dart';
import '../screens/search.dart';
import '../screens/onboarding.dart';
import '../screens/home.dart';
import '../screens/splash.dart';
import '../screens/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: RestaurantTheme.lightTheme,
      darkTheme: RestaurantTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
          id: ModalRoute.of(context)?.settings.arguments as String,
        ),
        SearchScreen.routeName: (context) => const SearchScreen(),
      },
    );
  }
}