import 'package:s2/data/model/resto_detail.dart';

sealed class RestoDetailResultState {}

class RestoDetailNoneState extends RestoDetailResultState {}

class RestoDetailLoadingState extends RestoDetailResultState {}

class RestoDetailErrorState extends RestoDetailResultState {
  final String error;
  RestoDetailErrorState(this.error);
}

class RestoDetailLoadedState extends RestoDetailResultState {
  final RestoDetail data;
  RestoDetailLoadedState(this.data);
}
