// resto_detail_response.dart
import 'package:s2/data/model/resto_detail.dart';

class RestoDetailResponse {
  final bool error;
  final String message;
  final RestoDetail? resto;

  RestoDetailResponse({required this.error, required this.message, this.resto});

  factory RestoDetailResponse.fromJson(Map<String, dynamic> json) {
    return RestoDetailResponse(
      error: json['error'] ?? true,
      message: json['message'] ?? '',
      resto: json['restaurant'] != null
          ? RestoDetail.fromJson(json['restaurant'])
          : null,
    );
  }
}
