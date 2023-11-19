import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/meal.dart';
import 'package:meals_enhanced/widgets/meal_details_list_info.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.name,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(90),
                bottomRight: Radius.circular(90),
              ),
              child: Hero(
                tag: meal.hashCode,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            MealDetailsListInfo(title: 'Ingredients', info: meal.ingredients),
            MealDetailsListInfo(title: 'Steps', info: meal.steps),
          ],
        ),
      ),
    );
  }
}
