import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/category.dart';

@immutable
class CategoriesScope extends StatefulWidget {
  const CategoriesScope({required this.child, super.key});

  final Widget child;

  static List<Category> watch(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_CategoriesInherited>()!.categories;

  @override
  State<CategoriesScope> createState() => _CategoriesScopeState();
}

class _CategoriesScopeState extends State<CategoriesScope> {
  @override
  Widget build(BuildContext context) {
    return _CategoriesInherited(
      categories: const [
        Category(title: 'Italian', color: Colors.purple, id: 'c1'),
        Category(title: 'Quick & Easy', color: Colors.red, id: 'c2'),
        Category(title: 'Hamburgers', color: Colors.orange, id: 'c3'),
        Category(title: 'German', color: Colors.brown, id: 'c4'),
        Category(title: 'Light & Lovely', color: Colors.lightBlue, id: 'c5'),
        Category(title: 'Exotic', color: Colors.green, id: 'c6'),
        Category(title: 'Breakfast', color: Colors.teal, id: 'c7'),
        Category(title: 'Asian', color: Colors.pink, id: 'c8'),
        Category(title: 'French', color: Color.fromARGB(255, 33, 86, 243), id: 'c9'),
        Category(title: 'Summer', color: Colors.amber, id: 'c10'),
      ],
      child: widget.child,
    );
  }
}

@immutable
class _CategoriesInherited extends InheritedWidget {
  const _CategoriesInherited({
    required this.categories,
    required super.child,
  });

  final List<Category> categories;

  @override
  bool updateShouldNotify(_CategoriesInherited oldWidget) => oldWidget.categories != categories;
}
