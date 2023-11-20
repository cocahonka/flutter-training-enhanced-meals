import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/category.dart';
import 'package:meals_enhanced/models/meal.dart';
import 'package:meals_enhanced/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    this.category,
    super.key,
  });

  final Category? category;

  @override
  Widget build(BuildContext context) {
    var meals = <Meal>[]; //MealsScope.watch(context);

    if (category != null) {
      meals = meals.where((meal) => meal.categories.contains(category!.id)).toList();
    }

    final Widget body;
    if (meals.isNotEmpty) {
      body = SingleChildScrollView(
        child: Column(
          children: [
            for (final meal in meals) MealItem(meal: meal),
          ],
        ),
      );
    } else {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing there!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Text(
              category != null ? 'Try selecting a different category!' : "You don't have favorites meals!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if (category != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(category!.title),
        ),
        body: body,
      );
    }

    return body;
  }
}
