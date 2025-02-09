import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/color.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/search_provider.dart';
import 'package:restaurant_app/widgets/search_list.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(apiService: ApiService()),
      child: Consumer<SearchProvider>(builder: (context, state, _) {
        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ), 
            title: const Text("Search Restaurants"),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0, 
            titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black, 
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                    state.fetchSearchedResto(value);
                  },
                  autofocus: true,
                  controller: _controller,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: query.isEmpty
                  ? const Center(child: Text('Cari restaurant favoritmu!'))
                  : const SearchResultList(),
              )
            ],
          ),
        );
      }),
    );
  }
}
