import 'package:s2/data/model/category.dart';
import 'package:s2/data/model/reviews.dart';

import 'menus.dart';

class RestoDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final Menus menus;
  final List<Category> categories;
  final List<Reviews> reviews;
  final double rating;

  RestoDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.menus,
    required this.categories,
    required this.reviews,
    required this.rating,
  });

  factory RestoDetail.fromJson(Map<String, dynamic> json) => RestoDetail(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    city: json['city'] as String,
    address: json['address'] as String,
    pictureId: json['pictureId'] as String,
    menus: Menus.fromJson(json['menus']),
    categories: List<Category>.from(
      (json['categories'] as List).map((x) => Category.fromJson(x)),
    ),
    reviews:
        (json['customerReviews'] as List<dynamic>?)
            ?.map((x) => Reviews.fromJson(x))
            .toList() ??
        [],

    rating: (json['rating'] as num).toDouble(),
  );
}
