import 'package:flutter/material.dart';

ThemeData? activeTheme;

final darkTheme= ThemeData(
    primaryColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.grey, // Your accent color
    ),
    brightness: Brightness.dark);
final blueTheme=ThemeData(
    primaryColor: Colors.blue,
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.grey, // Your accent color
    ),
    brightness: Brightness.light
);
final greenTheme=ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.grey, // Your accent color
    ),
    brightness: Brightness.light
);
final yellowTheme=ThemeData(
  primaryColor: Colors.yellow,
  primarySwatch: Colors.yellow,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.grey, // Your accent color
    ),
  brightness: Brightness.light
);