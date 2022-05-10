import 'dart:async';
import 'package:flutter/material.dart';
import '../data/model/resto_detail.dart';
import '../data/api/api_service.dart';

enum ResultState { Loading, NoData, HasData, Error }

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailProvider({required this.apiService, required this.id}) {
    _fetchDetailResto();
  }

  late RestaurantDetail _restoDetail;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantDetail get result => _restoDetail;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailResto() async {
    _state = ResultState.Loading;
    notifyListeners();
    final resto = await apiService.getRestoDetail(id);
    if (resto.error) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error';
    } else {
      _state = ResultState.HasData;
      notifyListeners();
      return _restoDetail = resto;
    }
  }
}