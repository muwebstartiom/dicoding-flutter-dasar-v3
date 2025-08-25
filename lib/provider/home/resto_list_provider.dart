import 'package:flutter/widgets.dart';
import 'package:s2/data/api/api_services.dart';
import 'package:s2/static/resto_list_result_state.dart';

class RestoListProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestoListProvider(this._apiServices);

  RestoListResultState _resultState = RestoListNoneState();

  RestoListResultState get resultState => _resultState;

  Future<void> fetchRestoList() async {
    final result = await _apiServices.getRestoList();

    if (result.error) {
      _resultState = RestoListErrorState(result.message);
    } else {
      _resultState = RestoListLoadedState(result.restaurants);
    }
    notifyListeners();
  }
}
