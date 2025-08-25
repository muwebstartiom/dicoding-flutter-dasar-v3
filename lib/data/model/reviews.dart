class Reviews {
  final String name;
  final String review;
  final String date;

  Reviews({required this.name, required this.review, required this.date});

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    name: json['name'] as String,
    review: json['review'] as String,
    date: json['date'] as String,
  );
}
