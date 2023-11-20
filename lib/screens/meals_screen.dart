import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/meal.dart';
import 'package:meals_enhanced/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    required this.getMeals,
    required this.emptyMealsMessage,
    this.title,
    super.key,
  });

  final List<Meal> Function(BuildContext) getMeals;
  final String? title;
  final String emptyMealsMessage;

  @override
  Widget build(BuildContext context) {
    final meals = getMeals(context);

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
              emptyMealsMessage,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if (title != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: body,
      );
    }

    return body;
  }
}
