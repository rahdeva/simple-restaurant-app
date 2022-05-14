import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/resto_provider.dart';
import 'package:restaurant_app/widgets/resto_items.dart';

class RestoList extends StatelessWidget {
  const RestoList({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestoProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return Expanded(
            child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              shrinkWrap: true,
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                var resto = state.result.restaurants[index];
                return RestaurantItems(resto: resto);
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}