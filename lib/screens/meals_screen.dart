import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/meal.dart';
import 'package:meals_enhanced/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    required this.title,
    required this.meals,
    super.key,
  });

  final List<Meal> meals;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
