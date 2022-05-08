import 'dart:async';
import 'package:flutter/material.dart';
import '../data/model/restaurant.dart';
import '../data/api/api_service.dart';

enum ResultState { Loading, NoData, HasData, Error }

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;

  DetailProvider({required this.apiService}) {
    _fetchDetailResto();
  }

  late RestaurantResult _restoResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantResult get result => _restoResult;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailResto() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final resto = await apiService.getRestoDetail();
      if (resto.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restoResult = resto;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
