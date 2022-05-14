import 'dart:async';
import 'package:flutter/material.dart';
import '../data/model/resto_detail.dart';
import '../data/api/api_service.dart';

enum ResultState { loading, noData, hasData, error }
enum SubmitState { loading, success, error }

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailProvider({required this.apiService, required this.id}) {
    _fetchDetailResto();
  }

  late RestaurantDetail _restoDetail;
  late ResultState _state;
  late SubmitState _submitState;
  String _message = '';

  String get message => _message;
  RestaurantDetail get result => _restoDetail;
  ResultState get state => _state;
  SubmitState get submitState => _submitState;


  Future<dynamic> _fetchDetailResto() async {
    _state = ResultState.loading;
    notifyListeners();
    final resto = await apiService.getRestoDetail(id);
    if (resto.error) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Whoops! mohon periksa koneksi internet Anda';
    } else {
      _state = ResultState.hasData;
      notifyListeners();
      return _restoDetail = resto;
    }
  }

  // Future<String?> postReview(ConsumerReviewPost consumerReview) async { //<-- disini fungsi postreview dibuat mereturn String? untuk mereturn pesan error nya untuk ditampilkan di snackbar, dan jika tidak ada pesan errornya, nanti di widgetnya tidak perlu memanggil getdetailrestaurant,
  //   try {
  //     _submitState = SubmitState.Loading;
  //     notifyListeners();
  //     await apiService.postReview(consumerReview);
  //     _submitState = SubmitState.Success;
  //     notifyListeners();
  //   } catch (e) {
  //     _submitState = SubmitState.Error;
  //     // _message = 'Error: $e';
  //     // notifyListeners();
  //     return e.toString(); //<-- jika gagal, error nya di return
  //   }
  // }
}