import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/widgets/detail_items.dart';
import '../data/api/api_service.dart';
import '../provider/detail_provider.dart';
import '../common/color.dart';

class DetailScreen extends StatelessWidget{
  static const routeName = '/detail';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (_) => DetailProvider(apiService: ApiService()),
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<DetailProvider>(
              builder: (context, state, _) {
                if (state.state == ResultState.Loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.state == ResultState.HasData) {
                  var resto = state.result.restaurants;
                  return Center(child: Text(state.message));
                } else if (state.state == ResultState.NoData) {
                  return Center(child: Text(state.message));
                } else if (state.state == ResultState.Error) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text(''));
                }
              },
            ),
          )
        ),
      ),
    );
  }
}