import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/filters.dart';

class FiltersScope extends StatefulWidget {
  const FiltersScope({required this.child, super.key});

  final Widget child;

  static Filters watch(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_FiltersInherited>()!.filters;
  static Filters read(BuildContext context) => context.getInheritedWidgetOfExactType<_FiltersInherited>()!.filters;

  @override
  State<FiltersScope> createState() => _FiltersScopeState();
}

class _FiltersScopeState extends State<FiltersScope> {
  final _model = Filters(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegeterian: false,
    isVegan: false,
  );

  @override
  Widget build(BuildContext context) {
    return _FiltersInherited(
      filters: _model,
      child: widget.child,
    );
  }
}

class _FiltersInherited extends InheritedNotifier {
  const _FiltersInherited({
    required this.filters,
    required super.child,
  });

  final Filters filters;
}
