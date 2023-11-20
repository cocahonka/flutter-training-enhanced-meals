import 'package:flutter/material.dart';
import 'package:meals_enhanced/extensions/capitalize.dart';
import 'package:meals_enhanced/scopes/favorites_meals_scope.dart';
import 'package:meals_enhanced/screens/categories_screen.dart';
import 'package:meals_enhanced/screens/meals_screen.dart';
import 'package:meals_enhanced/widgets/main_drawer.dart';

enum TabsContent {
  categories(icon: Icons.set_meal),
  favorites(icon: Icons.favorite);

  const TabsContent({required this.icon});

  final IconData icon;
}

class MealAppNavigationScreen extends StatefulWidget {
  const MealAppNavigationScreen({super.key});

  @override
  State<MealAppNavigationScreen> createState() => _MealAppNavigationScreenState();
}

class _MealAppNavigationScreenState extends State<MealAppNavigationScreen> {
  var _currentIndex = 0;
  var _currentPage = TabsContent.values.first;

  void _indexChanged(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = TabsContent.values[_currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = switch (_currentPage) {
      TabsContent.categories => 'Categories',
      TabsContent.favorites => 'Your Favorites',
    };

    final Widget content = switch (_currentPage) {
      TabsContent.categories => const CategoriesScreen(),
      TabsContent.favorites => const MealsScreen(
          getMeals: FavoritesMealsScope.watch,
          emptyMealsMessage: "You don't have favorites meals!",
        ),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _indexChanged,
        destinations: [
          for (final content in TabsContent.values)
            NavigationDestination(
              icon: Icon(content.icon),
              label: content.name.capitalize(),
            ),
        ],
      ),
      body: content,
    );
  }
}
