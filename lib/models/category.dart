import 'package:flutter/material.dart';

@immutable
class Category {
  const Category({
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category && other.title == title && other.color == color;
  }

  @override
  int get hashCode => Object.hash(title, color);
}