import 'package:flutter/material.dart';

@immutable
class Category {
  const Category({
    required this.title,
    required this.color,
    required this.id,
  });

  final String title;
  final Color color;
  final String id;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category && other.title == title && other.color == color && other.id == id;
  }

  @override
  int get hashCode => Object.hash(title, color);
}
