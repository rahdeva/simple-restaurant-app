import 'dart:math';

import 'package:flutter/material.dart';
import '../constants/color.dart';

class DetailScreen extends StatelessWidget{
  final resto;
  
  DetailScreen({Key? key, required this.resto}) : super(key: key);

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
                margin: EdgeInsets.only(top: 24.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  resto["name"],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_sharp),
                    Text(resto["city"])
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Row(
                  children: [
                    const Icon(Icons.star),
                    Text(resto["rating"].toString())
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  resto["description"],
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "Menu - Foods",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 1000, minHeight: 50.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: foodsResto.length,
                  itemBuilder: (context, i) {
                    final random = Random();
                    Color colors = colorList[random.nextInt(colorList.length)];
                    return Container(
                      margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                      height: 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colors.withOpacity(0.7),
                            colors,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 6.0),
                        child: Text(foodsResto[i]["name"], style: TextStyle(color: Colors.white),)
                      ),
                    );
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "Menu - Drinks",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 1000, minHeight: 50.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: drinksResto.length,
                  itemBuilder: (context, i) {
                    final random = Random();
                    Color colors = colorList[random.nextInt(colorList.length)];
                    return Container(
                      margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                      height: 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            colors.withOpacity(0.7),
                            colors,
                          ], // red to yellow
                          // tileMode: TileMode.repeated, // repeats the gradient over the canvas
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 6.0),
                        child: Text(drinksResto[i]["name"], style: TextStyle(color: Colors.white),)
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}