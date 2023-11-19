import 'package:flutter/material.dart';
import 'package:meals_enhanced/scopes/categories_scope.dart';
import 'package:meals_enhanced/screens/categories_screen.dart';

void main() {
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    );

    return MaterialApp(
      theme: ThemeData.dark().copyWith(colorScheme: colorScheme),
      home: const CategoriesScope(
        child: CategoriesScreen(),
      ),
    );
  }
}
