import 'package:s2/data/model/resto.dart';

sealed class RestoListResultState {}

class RestoListNoneState extends RestoListResultState {}

class RestoListLoadingState extends RestoListResultState {}

class RestoListErrorState extends RestoListResultState {
  final String error;

  RestoListErrorState(this.error);
}

class RestoListLoadedState extends RestoListResultState {
  final List<Resto> data;

  RestoListLoadedState(this.data);
}
