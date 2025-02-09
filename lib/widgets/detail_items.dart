import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/customers_reviews.dart';
import 'package:restaurant_app/widgets/menu_items.dart';
import '../data/model/resto_detail.dart';

class DetailItems extends StatelessWidget {
  final Restaurant detail;
  final String picsURL = "https://restaurant-api.dicoding.dev/images/large/";

  const DetailItems({required this.detail, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
                tag: detail.id,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 320,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(picsURL + detail.pictureId),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )),
                )),
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
              detail.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_sharp),
                  Text(detail.city)
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star),
                  Text(detail.rating.toString())
                ],
              ),
            ],
          ),
        ),
        const TitleWidgets(text: "Description"),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            detail.description,
            textAlign: TextAlign.justify,
          ),
        ),
        const TitleWidgets(text: "Menu - Foods"),
        MenuItems(menu: detail.menus.foods),
        const TitleWidgets(text: "Menu - Drinks"),
        MenuItems(menu: detail.menus.drinks),
        const TitleWidgets(text: "Customer Reviews"),
        CustomerReviews(review: detail.customerReviews, id: detail.id),
        const SizedBox(height: 24,)
      ],
    );
  }
}

class TitleWidgets extends StatelessWidget {
  final String text;
  const TitleWidgets({super.key, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.only(left: 24.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }
}
