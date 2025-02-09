import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/detail_items.dart';
import '../data/api/api_service.dart';
import '../provider/detail_provider.dart';
import '../common/color.dart';

class DetailScreen extends StatelessWidget{
  static const routeName = '/detail';
  final String id;

  const DetailScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (_) => DetailProvider(apiService: ApiService(), id: id),
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<DetailProvider>(
              builder: (context, state, _) {
                if (state.state == ResultState.loading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator())
                  );
                } else if (state.state == ResultState.hasData) {
                  var detail = state.result.restaurant;
                  return DetailItems(detail: detail);
                } else if (state.state == ResultState.noData) {
                  return Center(child: Text(state.message));
                } else if (state.state == ResultState.error) {
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