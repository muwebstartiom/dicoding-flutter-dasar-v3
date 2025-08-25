import 'package:flutter/widgets.dart';
import 'package:s2/data/api/api_services.dart';
import 'package:s2/data/model/resto_detail.dart';
import 'package:s2/static/resto_detail_result_state.dart';

class RestoDetailProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestoDetailProvider(this._apiServices);

  RestoDetailResultState _resultState = RestoDetailNoneState();
  RestoDetailResultState get resultState => _resultState;

  Future<void> fetchRestoDetail(String id) async {
    try {
      _resultState = RestoDetailLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestoDetail(id);

      if (result.error) {
        _resultState = RestoDetailErrorState(result.message);
      } else if (result.resto == null) {
        _resultState = RestoDetailErrorState("Data resto kosong");
      } else {
        _resultState = RestoDetailLoadedState(result.resto!);
      }
      notifyListeners();
    } catch (e) {
      _resultState = RestoDetailErrorState(e.toString());
      notifyListeners();
    }
  }
}
