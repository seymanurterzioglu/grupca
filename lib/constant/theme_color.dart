import 'package:flutter/material.dart';

ThemeData? activeTheme;

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
  iconTheme: IconThemeData(color: Colors.white),
);

final blueTheme = ThemeData(
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  // colorScheme: ColorScheme.fromSwatch().copyWith(
  //   secondary: Colors.grey, // Your accent color
  // ),
  brightness: Brightness.light,
  textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),
  iconTheme: const IconThemeData(color: Colors.white),
  cardColor: Colors.blue,
  bottomAppBarColor: Colors.blue,
  backgroundColor: Colors.blue,
  dividerColor: Colors.blue,
);

final greenTheme = ThemeData(
  primaryColor: Colors.green,
  primarySwatch: Colors.green,
  brightness: Brightness.light,
  textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),
  iconTheme: const IconThemeData(color: Colors.white),
  cardColor: Colors.green,
  bottomAppBarColor: Colors.green,
  backgroundColor: Colors.green,
  dividerColor: Colors.green,
);

final yellowTheme = ThemeData(
  primaryColor: Colors.yellow,
  primarySwatch: Colors.yellow,
  brightness: Brightness.light,
  textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),
  iconTheme: const IconThemeData(color: Colors.white),
  cardColor: Colors.yellow,
  bottomAppBarColor: Colors.yellow,
  backgroundColor: Colors.yellow,
  dividerColor: Colors.yellow,
);
