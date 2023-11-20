import 'package:flutter/material.dart';
import 'package:meals_enhanced/widgets/filter_switch.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              value: false,
              onChanged: (value) {},
            ),
            FilterSwitch(
              title: 'Lactose-free',
              description: 'Only included lactose-free meals',
              value: false,
              onChanged: (value) {},
            ),
            FilterSwitch(
              title: 'Vegeterian',
              description: 'Only included vegeterian meals',
              value: false,
              onChanged: (value) {},
            ),
            FilterSwitch(
              title: 'Vegan',
              description: 'Only included vegan meals',
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
