import 'package:flutter/material.dart';
import '../data/model/restaurant.dart';
import '../screens/detail.dart';

class RestaurantItems extends StatelessWidget {
  final Restaurant resto;
  final String picsURL = "https://restaurant-api.dicoding.dev/images/medium/";

  const RestaurantItems({Key? key, required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailScreen(id: resto.id!);
          }));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: resto.id!,
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(picsURL + resto.pictureId!),
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
                      resto.name!,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on_sharp),
                        Text(resto.city!)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        Text(resto.rating.toString())
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
