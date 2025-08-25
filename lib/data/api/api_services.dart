import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:s2/data/model/resto.dart';
import 'package:s2/data/model/resto_detail_response.dart';
import 'package:s2/data/model/resto_list_response.dart';
import 'package:s2/data/model/resto_search_response.dart';

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev/";

  Future<RestoListResponse> getRestoList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> restaurantsJson = data['restaurants'];
      final List<Resto> restos = restaurantsJson
          .map((json) => Resto.fromJson(json))
          .toList();

      return RestoListResponse(
        error: data['error'],
        message: data['message'],
        restaurants: restos,
      );
    } else {
      throw Exception('Failed to load Resto list');
    }
  }

  Future<RestoDetailResponse> getRestoDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return RestoDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Resto detail');
    }
  }

  Future<RestoSearchResponse> searchResto(String query) async {
    final uri = Uri.parse(
      "$_baseUrl/search?q=${Uri.encodeQueryComponent(query)}",
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return RestoSearchResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Resto search');
    }
  }
}
