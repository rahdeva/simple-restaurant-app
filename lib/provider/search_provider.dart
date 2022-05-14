import 'dart:async';
import 'package:flutter/material.dart';
import '../data/model/search_restaurants.dart';
import '../data/api/api_service.dart';

enum ResultState { Loading, NoData, HasData, Error }

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchProvider({required this.apiService}) {
    fetchSearchedResto('');
  }

  late SearchRestaurant _restoResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  SearchRestaurant get result => _restoResult;
  ResultState get state => _state;

  Future<dynamic> fetchSearchedResto(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final search = await apiService.searchResto(query);
      if (search.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restoResult = search;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
