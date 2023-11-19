import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/category.dart';

@immutable
class CategoriesScope extends StatefulWidget {
  const CategoriesScope({required this.child, super.key});

  final Widget child;

  List<Category> watch(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_CategoriesInherited>()!.categories;

  @override
  State<CategoriesScope> createState() => _CategoriesScopeState();
}

class _CategoriesScopeState extends State<CategoriesScope> {
  @override
  Widget build(BuildContext context) {
    return _CategoriesInherited(
      categories: const [
        Category(title: 'Italian', color: Colors.purple),
        Category(title: 'Quick & Easy', color: Colors.red),
        Category(title: 'Hamburgers', color: Colors.orange),
        Category(title: 'German', color: Colors.yellow),
        Category(title: 'Light & Lovely', color: Colors.lightBlue),
        Category(title: 'Exotic', color: Colors.green),
        Category(title: 'Breakfast', color: Colors.teal),
        Category(title: 'Asian', color: Colors.pink),
        Category(title: 'French', color: Colors.blue),
        Category(title: 'Summer', color: Colors.amber),
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
