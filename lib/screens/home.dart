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
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),	
                          ),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //   return DetailScreen(place: place);
                              // }));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(_items[index]["pictureId"]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(_items[index]["name"],
                                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_sharp),
                                            Text(_items[index]["city"])
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.star),
                                            Text(_items[index]["rating"].toString())
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
                : const Center(child: Text("Data kosong!"))
          ],
        ),
    );
  }
}