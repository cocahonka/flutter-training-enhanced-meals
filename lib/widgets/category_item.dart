import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/category.dart';
import 'package:meals_enhanced/scopes/meals_scope.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    required this.onCategoryTap,
    super.key,
  });

  final Category category;
  final VoidCallback onCategoryTap;

  @override
  Widget build(BuildContext context) {
    final meals = MealsScope.watch(context);
    final randomMeal = (meals.where((meal) => meal.categories.contains(category.id)).toList()..shuffle()).first;

    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: randomMeal.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  category.color.withOpacity(0.7),
                  category.color,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.9),
                    ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onTap: onCategoryTap,
            ),
          ),
        ),
      ],
    );
  }
}
