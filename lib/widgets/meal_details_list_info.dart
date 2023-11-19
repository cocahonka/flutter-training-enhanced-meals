import 'package:flutter/material.dart';

class MealDetailsListInfo extends StatelessWidget {
  const MealDetailsListInfo({
    required this.info,
    required this.title,
    super.key,
  });

  final String title;
  final List<String> info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        for (final text in info)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
      ],
    );
  }
}
