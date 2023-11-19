import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    required this.onTap,
    super.key,
  });

  final Category category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
