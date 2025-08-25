import 'dart:math';
import 'package:flutter/material.dart';

class MenuRestoSection<T> extends StatelessWidget {
  final String title;
  final List<T> menuList;

  const MenuRestoSection({
    super.key,
    required this.title,
    required this.menuList,
  });

  // List warna pastel
  Color _getRandomPastelColor() {
    final random = Random();
    final pastelColors = [
      Colors.pink.shade100,
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.orange.shade100,
      Colors.purple.shade100,
      Colors.yellow.shade100,
      Colors.teal.shade100,
      Colors.cyan.shade100,
      Colors.lime.shade100,
    ];
    return pastelColors[random.nextInt(pastelColors.length)];
  }

  // Icon makanan random
  IconData _getRandomFoodIcon() {
    final random = Random();
    final icons = [
      Icons.local_pizza,
      Icons.fastfood,
      Icons.ramen_dining,
      Icons.cake,
      Icons.bakery_dining,
      Icons.set_meal,
    ];
    return icons[random.nextInt(icons.length)];
  }

  // Icon minuman random
  IconData _getRandomDrinkIcon() {
    final random = Random();
    final icons = [
      Icons.local_cafe,
      Icons.icecream,
      Icons.local_drink,
      Icons.emoji_food_beverage,
      Icons.sports_bar,
    ];
    return icons[random.nextInt(icons.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            final menuItem = menuList[index];
            final bgColor = _getRandomPastelColor();

            // Pilih icon berdasarkan tipe title
            final icon = title.toLowerCase().contains('drink')
                ? _getRandomDrinkIcon()
                : _getRandomFoodIcon();

            return Card(
              color: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 40, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    (menuItem as dynamic).name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
