import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/resto_detail.dart';
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

  Future<RestaurantResult> searchResto(final String _query) async {
    final response = await http.get(Uri.parse(_baseUrl + "/search?q=" + _query));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search');
    }
  }
  
  Future<RestaurantResult> postReview() async {
    final response = await http.post(Uri.parse(_baseUrl + "/review"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post reviews');
    }
  }
}
