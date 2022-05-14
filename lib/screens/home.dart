import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/search.dart';
import '../data/api/api_service.dart';
import '../provider/resto_provider.dart';
import '../widgets/resto_list.dart';
import '../common/color.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Image.asset("assets/images/textLogo.png")
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const SearchScreen()
                )
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                child: const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                      )
                    ),
                  ),
              ),
            ),
            ChangeNotifierProvider<RestoProvider>(
              create: (_) => RestoProvider(apiService: ApiService()),
              child: const RestoList(),
            ),
            const SizedBox(height: 24.0,)
          ],
        ),
    );
  }
}