import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/color.dart';
import '../screens/detail.dart';

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

  @override
  void initState() {
    if(_items.isEmpty) readJson();
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = _items;
    } else {
      results = _items
          .where((resto) =>
              resto["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    
    setState(() {
      _foundItems = results;
    });
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
              // margin: EdgeInsets.only(top: 16.0),
              padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
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
                        final resto = _foundItems[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),	
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return DetailScreen(resto: resto);
                              }));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Hero(
                                  tag: resto["id"],
                                  child: Container(
                                    width: 200,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(resto["pictureId"]),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(resto["name"],
                                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on_sharp),
                                            Text(resto["city"])
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(Icons.star),
                                            Text(resto["rating"].toString())
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
          ],
        ),
    );
  }
}