import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/category.dart';
import 'package:meals_enhanced/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary,
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) {
              return MealsScreen(category: category);
            },
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              category.color.withOpacity(0.8),
              category.color.withOpacity(0.7),
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
    );
  }
}
