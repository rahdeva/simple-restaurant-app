import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/color.dart';
import '../widgets/resto_items.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _items = [];
  List _foundItems = [];

  Future readJson() async {
    final String response = await rootBundle.loadString('assets/local_restaurant.json');
    final data = await json.decode(response);
    
    setState(() {
      _items = data["restaurants"];
      _foundItems = _items;
    });
  }

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = _items;
    } else {
      results = _items.where(
        (resto) => resto["name"].toLowerCase().contains(enteredKeyword.toLowerCase())
      ).toList();
    }
    
    setState(() {
      _foundItems = results;
    });
  }

  @override
  void initState() {
    if(_items.isEmpty) readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: 
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Image.asset("assets/images/textLogo.png")
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
              child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                    )
                  ),
                ),
            ),
            _foundItems.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      itemCount: _foundItems.length,
                      itemBuilder: (context, index) {
                        return RestaurantItems(_foundItems, index);
                      },
                    ),
                  )
                : const Text('No results found',style: TextStyle(fontSize: 24)),
          ],
        ),
    );
  }
}