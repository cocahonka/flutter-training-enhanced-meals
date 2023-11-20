// ignore_for_file: hash_and_equals

import 'package:flutter/foundation.dart';
import 'package:meals_enhanced/models/affordability.dart';
import 'package:meals_enhanced/models/complexity.dart';

@immutable
class Meal {
  const Meal({
    required this.name,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegeterian,
    required this.isVegan,
    required this.categories,
  });

  final String name;
  final String imageUrl;

  final Duration duration;
  final Complexity complexity;
  final Affordability affordability;

  final List<String> ingredients;
  final List<String> steps;

  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegeterian;
  final bool isVegan;

  final List<String> categories;

  Meal clone() {
    return Meal(
      name: name,
      imageUrl: imageUrl,
      duration: duration,
      complexity: complexity,
      affordability: affordability,
      ingredients: [...ingredients],
      steps: [...steps],
      isGlutenFree: isGlutenFree,
      isLactoseFree: isLactoseFree,
      isVegeterian: isVegeterian,
      isVegan: isVegan,
      categories: [...categories],
    );
  }

  @override
  bool operator ==(Object other) => throw UnsupportedError(
        'Comparison of Meal objects is not supported.',
      );
}
