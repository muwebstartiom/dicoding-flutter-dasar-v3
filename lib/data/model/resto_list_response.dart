import 'package:s2/data/model/resto.dart';

class RestoListResponse {
  final bool error;
  final String message;
  final List<Resto> restaurants;

  RestoListResponse({
    required this.error,
    required this.message,
    required this.restaurants,
  });

  factory RestoListResponse.fromJson(Map<String, dynamic> json) {
    return RestoListResponse(
      error: json['error'],
      message: json['message'],
      restaurants: (json['restaurants'] as List)
          .map((e) => Resto.fromJson(e))
          .toList(),
    );
  }
}
