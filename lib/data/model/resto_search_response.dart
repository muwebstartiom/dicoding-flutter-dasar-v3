import 'package:s2/data/model/resto.dart';

class RestoSearchResponse {
  final bool error;
  final int founded;
  final List<Resto> resto;

  RestoSearchResponse({
    required this.error,
    required this.founded,
    required this.resto,
  });

  factory RestoSearchResponse.fromJson(Map<String, dynamic> json) {
    return RestoSearchResponse(
      error: json['error'],
      founded: json["founded"],
      resto: (json['restaurants'] as List)
          .map((e) => Resto.fromJson(e))
          .toList(),
    );
  }
}
