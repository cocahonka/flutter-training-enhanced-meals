import 'package:flutter/material.dart';
import 'package:meals_enhanced/extensions/change_notifier_selector.dart';
import 'package:meals_enhanced/scopes/filters_scope.dart';
import 'package:meals_enhanced/widgets/filter_switch.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = FiltersScope.read(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            FilterSwitch(
              title: 'Gluten-free',
              description: 'Only included gluten-free meals',
              valueListenable: filters.select((controller) => controller.isGlutenFree),
              onChanged: (value) => filters.isGlutenFree = value,
            ),
            FilterSwitch(
              title: 'Lactose-free',
              description: 'Only included lactose-free meals',
              valueListenable: filters.select((controller) => controller.isLactoseFree),
              onChanged: (value) => filters.isLactoseFree = value,
            ),
            FilterSwitch(
              title: 'Vegeterian',
              description: 'Only included vegeterian meals',
              valueListenable: filters.select((controller) => controller.isVegeterian),
              onChanged: (value) => filters.isVegeterian = value,
            ),
            FilterSwitch(
              title: 'Vegan',
              description: 'Only included vegan meals',
              valueListenable: filters.select((controller) => controller.isVegan),
              onChanged: (value) => filters.isVegan = value,
            ),
          ],
        ),
      ),
    );
  }
}
