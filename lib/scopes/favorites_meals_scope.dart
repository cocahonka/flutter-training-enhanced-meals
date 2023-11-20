import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/meal.dart';

@immutable
class FavoritesMealsScope extends StatefulWidget {
  const FavoritesMealsScope({required this.child, super.key});

  final Widget child;

  static List<Meal> watch(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_FavoritesInherited>()!.meals;

  // ignore: library_private_types_in_public_api
  static _FavoritesInherited read(BuildContext context) =>
      context.getInheritedWidgetOfExactType<_FavoritesInherited>()!;

  @override
  State<FavoritesMealsScope> createState() => _FavoritesMealsScopeState();
}

class _FavoritesMealsScopeState extends State<FavoritesMealsScope> {
  var _meals = <Meal>[];

  bool _toggleFavorite(Meal meal) {
    final isAlreadyFavorite = _meals.contains(meal);

    final clone = _meals.map((meal) => meal.clone()).toList();
    if (isAlreadyFavorite) {
      setState(() {
        _meals = clone..remove(meal);
      });
    } else {
      setState(() {
        _meals = clone..add(meal);
      });
    }

    return isAlreadyFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return _FavoritesInherited(
      meals: _meals,
      toggleFavorite: _toggleFavorite,
      child: widget.child,
    );
  }
}

class _FavoritesInherited extends InheritedWidget {
  const _FavoritesInherited({
    required this.meals,
    required this.toggleFavorite,
    required super.child,
  });

  final List<Meal> meals;

  final bool Function(Meal) toggleFavorite;

  @override
  bool updateShouldNotify(_FavoritesInherited oldWidget) => meals != oldWidget.meals;
}
