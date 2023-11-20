import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({
    required this.title,
    required this.description,
    required this.valueListenable,
    required this.onChanged,
    super.key,
  });

  final String title;
  final String description;
  final ValueListenable<bool> valueListenable;
  final ValueSetter<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, child) {
        return SwitchListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            description,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
          value: value,
          onChanged: onChanged,
        );
      },
    );
  }
}
