import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/home.dart';
import '../screens/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      // initialRoute: HomeScreen.routeName,
      // routes: {
      //   NewsListPage.routeName: (context) => NewsListPage(),
      //   ArticleDetailPage.routeName: (context) => ArticleDetailPage(
      //         article: ModalRoute.of(context)?.settings.arguments as Article,
      //       ),
      //   ArticleWebView.routeName: (context) => ArticleWebView(
      //         url: ModalRoute.of(context)?.settings.arguments as String,
      //       ),
      // },
    );
  }
}