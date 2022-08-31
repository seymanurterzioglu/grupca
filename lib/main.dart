import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grupca/theme_data.dart';
import 'package:grupca/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  // for change statusbar color (the place that have time,charge)
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeNotifier>(context);
          return MaterialApp(
            title: 'Grupca',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            home: HomePage(),
          );
        },
      );
}
