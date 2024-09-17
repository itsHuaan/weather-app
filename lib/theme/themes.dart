import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 245, 245, 245),
    onSurface: Color.fromARGB(255, 30, 30, 30),
    primary: Color.fromARGB(255, 220, 220, 220),
    onPrimary: Color.fromARGB(255, 50, 50, 50),
    secondary: Color.fromARGB(255, 200, 200, 200),
    onSecondary: Color.fromARGB(255, 60, 60, 60),
    tertiary: Color.fromARGB(255, 180, 180, 180),
    onTertiary: Color.fromARGB(255, 80, 80, 80),
    error: Color.fromARGB(255, 255, 69, 58),
    onError: Color.fromARGB(255, 255, 255, 255),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 18, 18, 18),
    onSurface: Color.fromARGB(255, 240, 240, 240),
    primary: Color.fromARGB(255, 33, 33, 33),
    onPrimary: Color.fromARGB(255, 220, 220, 220),
    secondary: Color.fromARGB(255, 44, 44, 44),
    onSecondary: Color.fromARGB(255, 210, 210, 210),
    tertiary: Color.fromARGB(255, 60, 60, 60),
    onTertiary: Color.fromARGB(255, 190, 190, 190),
    error: Color.fromARGB(255, 255, 69, 58),
    onError: Color.fromARGB(255, 255, 255, 255),
  ),
);
