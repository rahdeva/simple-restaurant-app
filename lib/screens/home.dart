import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/model/restaurant.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _items = [];

  Future readJson() async {
    final String response = await rootBundle.loadString('assets/local_restaurant.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["restaurants"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: 
        Column(
          children: [
            ElevatedButton(
              child: const Text('Load Data'),
              onPressed: readJson,
            ),

            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return DetailScreen(place: place);
                            // }));
                          },
                          child: Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  // child: Hero(tag: "photo", child: Image.network(_items[index]["pictureID"])),
                                  child: Image.network(_items[index]["pictureId"]),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(_items[index]["name"],
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(_items[index]["city"]),
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
                : Container()
          ],
        ),
    );
  }
}