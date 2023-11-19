import 'package:flutter/material.dart';
import 'package:meals_enhanced/scopes/categories_scope.dart';
import 'package:meals_enhanced/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesScope.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryItem(
              category: category,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
