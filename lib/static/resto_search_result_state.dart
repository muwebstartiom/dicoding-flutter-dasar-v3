import 'package:s2/data/model/resto.dart';

sealed class RestoSearchState {}

final class RestoSearchInitial extends RestoSearchState {}

final class RestoSearchLoading extends RestoSearchState {}

final class RestoSearchLoaded extends RestoSearchState {
  final List<Resto> result;
  RestoSearchLoaded({required this.result});
}

final class RestoSearchError extends RestoSearchState {
  final String message;
  RestoSearchError({required this.message});
}
