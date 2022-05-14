import 'dart:async';
import 'package:flutter/material.dart';
import '../data/model/search_restaurants.dart';
import '../data/api/api_service.dart';

enum ResultState { loading, noData, hasData, error }

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
      _state = ResultState.loading;
      notifyListeners();
      final search = await apiService.searchResto(query);
      if (search.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Data yang Anda cari tidak ada';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restoResult = search;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Whoops! mohon periksa koneksi internet Anda';
    }
  }
}
