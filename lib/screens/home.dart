import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/screens/detail.dart';

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
  void initState() {
    if(_items.isEmpty) readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Image.asset("assets/images/textLogo.png")
            ),
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final resto = _items[index];
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
                : const Center(child: Text("Data kosong!"))
          ],
        ),
    );
  }
}