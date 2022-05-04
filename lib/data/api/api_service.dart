import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/restaurant.dart';

class ApiService {
  final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  final String _category = 'business';
  final String _country = 'id';

  final String _id = 'rqdv5juczeskfw1e867';
  final String _query = 'Makan';
  
  Future<Restaurant> getRestoList() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get data Restaurant');
    }
  }

  Future<Restaurant> getRestoDetail() async {
    final response = await http.get(Uri.parse(_baseUrl + "detail/" + _id));
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get details');
    }
  }

  Future<Restaurant> searchResto() async {
    final response = await http.get(Uri.parse(_baseUrl + "/search?q=" + _query));
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search');
    }
  }

  Future<Restaurant> postReview() async {
    final response = await http.get(Uri.parse(_baseUrl + "/review"));
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post reviews');
    }
  }
}
