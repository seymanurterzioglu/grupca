import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toogleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black54,
    dividerColor: Colors.white,
    colorScheme: ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 10,
      iconTheme: IconThemeData(color: Colors.purple),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.purple),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)),
    bottomAppBarColor: Colors.purple,
    cardColor: Colors.grey,
  );

  static final lightTheme = ThemeData(
    // buttonTheme: ButtonThemeData(
    //   splashColor: Colors.orangeAccent,
    //    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    dividerColor: Colors.black,
    //primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.orangeAccent,
      elevation: 10,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: const IconThemeData(color: Colors.orangeAccent),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)),
  );
}

// ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   switchTheme: SwitchThemeData(
//     trackColor: MaterialStateProperty.all<Color>(Colors.grey),
//     thumbColor: MaterialStateProperty.all<Color>(Colors.white),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20.0),
//           borderSide: BorderSide.none),
//       filled: true,
//       fillColor: Colors.grey.withOpacity(0.1)),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//               const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
//           shape: MaterialStateProperty.all<OutlinedBorder>(
//               RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0))),
//           backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//           foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
//           overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
// );
//
