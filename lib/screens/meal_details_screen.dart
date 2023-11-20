import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/meal.dart';
import 'package:meals_enhanced/scopes/favorites_meals_scope.dart';
import 'package:meals_enhanced/widgets/meal_details_list_info.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({required this.meal, super.key});

  final Meal meal;

  void _onFavoriteToggle(BuildContext context) {
    final isAlreadyFavorite = FavoritesMealsScope.read(context).toggleFavorite(meal);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(isAlreadyFavorite ? 'Meal no longer a favorite' : 'Meal marked as favorite!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = FavoritesMealsScope.watch(context).contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.name,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () => _onFavoriteToggle(context),
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: child,
                );
              },
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline, key: ValueKey(isFavorite)),
            ),
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
