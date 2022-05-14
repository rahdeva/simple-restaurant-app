import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/search_provider.dart';
import '../widgets/search_items.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var resto = state.result.restaurants[index];
              return SearchResultItems(resto: resto);
            },
          );
        } else if (state.state == ResultState.noData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}