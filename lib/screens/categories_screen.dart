import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/category.dart';
import 'package:meals_enhanced/scopes/categories_scope.dart';
import 'package:meals_enhanced/scopes/meals_scope.dart';
import 'package:meals_enhanced/screens/meals_screen.dart';
import 'package:meals_enhanced/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _onCategoryTap(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return MealsScreen(
            getMeals: (context) =>
                MealsScope.watch(context).where((meal) => meal.categories.contains(category.id)).toList(),
            emptyMealsMessage: 'Try selecting a different category!',
            title: category.title,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesScope.watch(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            category: category,
            onCategoryTap: () => _onCategoryTap(context, category),
          );
        },
      ),
    );
  }
}
