class Resto {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  Resto({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Resto.fromJson(Map<String, dynamic> json) => Resto(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    pictureId: json['pictureId'],
    city: json['city'],
    rating: (json['rating'] as num).toDouble(),
  );
}
