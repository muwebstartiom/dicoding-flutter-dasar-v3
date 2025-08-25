import 'package:flutter/material.dart';
import 'package:s2/data/model/resto_detail.dart';
import 'package:s2/screen/detail/menu_detail_widget.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  final RestoDetail restoDetail;

  const BodyOfDetailScreenWidget({super.key, required this.restoDetail});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'restaurant_hero_${restoDetail.id}',
              child: Image.network(
                'https://restaurant-api.dicoding.dev/images/medium/${restoDetail.pictureId}',
                fit: BoxFit.cover,
                height: 250,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restoDetail.name,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        restoDetail.city,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Wrap(
                spacing: 8,
                children: restoDetail.categories
                    .map(
                      (category) => Chip(
                        backgroundColor: const Color.fromARGB(255, 16, 54, 17),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        label: Text(
                          category.name,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 4),
                  Text(
                    restoDetail.rating.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.red),
                  const SizedBox(width: 4),
                  Text(
                    '${restoDetail.city}, ${restoDetail.address}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),

            Text(
              restoDetail.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            MenuRestoSection(title: 'Foods', menuList: restoDetail.menus.foods),
            MenuRestoSection(
              title: 'Drinks',
              menuList: restoDetail.menus.drinks,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reviews",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  restoDetail.reviews.isEmpty
                      ? const Text("No reviews yet")
                      : Column(
                          children: restoDetail.reviews.map((review) {
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: ListTile(
                                title: Text(
                                  review.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(review.review),
                                trailing: Text(
                                  review.date,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
