import 'package:flutter/material.dart';
import 'package:s2/data/api/api_services.dart';
import 'package:s2/data/model/resto.dart';
import 'package:s2/static/resto_search_result_state.dart';

class RestoSearchProvider extends ChangeNotifier {
  final ApiServices apiService;

  RestoSearchState _state = RestoSearchInitial();
  RestoSearchState get state => _state;

  RestoSearchProvider(this.apiService);

  Future<void> searchResto(String query) async {
    if (query.isEmpty) {
      _state = RestoSearchInitial();
      notifyListeners();
      return;
    }
    _state = RestoSearchLoading();
    notifyListeners();
    try {
      final response = await apiService.searchResto(query);
      _state = RestoSearchLoaded(result: response.resto);
    } catch (e) {
      _state = RestoSearchError(message: e.toString());
    }
    notifyListeners();
  }
}
