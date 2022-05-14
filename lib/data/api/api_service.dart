import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/resto_detail.dart';
import '../model/search_restaurants.dart';
import '../model/restaurant.dart';

class ApiService {
  final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  
  Future<RestaurantResult> getRestoList() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get data Restaurant');
    }
  }

  Future<RestaurantDetail> getRestoDetail(final String _id) async {
    final response = await http.get(Uri.parse(_baseUrl + "detail/" + _id));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get details');
    }
  }

  Future<SearchRestaurant> searchResto(final String _query) async {
    final String _newQuery = _query.replaceAll(' ', '%20');
    final response = await http.get(Uri.parse(_baseUrl + "search?q=" + _newQuery));
    if (response.statusCode == 200) {
      return SearchRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search');
    }
  }
  
  Future<RestaurantResult> postReview(String name, String id, String review) async {
    final response = await http.post(
      Uri.parse(_baseUrl + "review"), 
      body: json.encode({
        'id': id,
        'name': name,
        'review': review,
      }),
    );
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post reviews');
    }
  }
}
