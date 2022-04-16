import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget{
  final resto;

  DetailScreen({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(resto["menus"]["foods"]);
    return Scaffold(
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
                margin: EdgeInsets.only(top: 16.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "Menu - Foods",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "Menu - Drinks",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "Menu - Drinks",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}