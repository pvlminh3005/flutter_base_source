import 'package:flutter/material.dart';

class ThemeModel {
  final String name;
  final Color primary;
  final Color secondary;

  ThemeModel({
    required this.name,
    required this.primary,
    required this.secondary,
  });
}

List<ThemeModel> themeSupport = [
  ThemeModel(
    name: 'main',
    primary: const Color(0xFF1e90ff),
    secondary: Colors.pinkAccent,
  ),
];
