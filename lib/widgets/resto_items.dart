import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/detail.dart';

// ignore: must_be_immutable
class RestaurantItems extends StatelessWidget {
  List resto;
  int index;

  RestaurantItems(this.resto, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailScreen(resto: resto[index]);
          }));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: resto[index]["id"],
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(resto[index]["pictureId"]),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      resto[index]["name"],
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on_sharp),
                        Text(resto[index]["city"])
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        Text(resto[index]["rating"].toString())
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
  }
}
