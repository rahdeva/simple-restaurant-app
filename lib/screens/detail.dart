import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/menu_items.dart';
import '../common/color.dart';

class DetailScreen extends StatelessWidget{
  static const routeName = '/detail';
  final resto;
  
  const DetailScreen({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodsResto = resto["menus"]["foods"];
    final drinksResto = resto["menus"]["drinks"];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    tag: resto["id"], 
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(resto["pictureId"]),
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0), 
                          bottomRight: Radius.circular(10.0), 
                        )
                      ),
                    )
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 24.0),
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  resto["name"],
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on_sharp),
                        Text(resto["city"])
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        Text(resto["rating"].toString())
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                padding: const EdgeInsets.only(left: 24.0),
                child: const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  resto["description"],
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                padding: const EdgeInsets.only(left: 24.0),
                child: const Text(
                  "Menu - Foods",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              MenuItems(menu: foodsResto),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                padding: const EdgeInsets.only(left: 24.0),
                child: const Text(
                  "Menu - Drinks",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              MenuItems(menu: drinksResto),
            ],
          ),
        )
      ),
    );
  }
}