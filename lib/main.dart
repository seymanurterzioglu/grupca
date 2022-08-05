import 'package:flutter/material.dart';
import 'package:grupca/constant/theme_color.dart';
import 'package:grupca/constant/theme_notifier.dart';
import 'package:grupca/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((pref) {
    var themeColor = pref.getString('ThemeMode');
    if (themeColor == "Dark") {
      activeTheme = darkTheme;
    } else if (themeColor == "Blue") {
      activeTheme = blueTheme;
    } else if (themeColor == "Yellow") {
      activeTheme = yellowTheme;
    } else {
      activeTheme = greenTheme;
    }
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier(activeTheme!))
      ],
      child: const MyApp(),
    ));
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier= Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme,
      home: const HomePage(),
    );
  }
}
