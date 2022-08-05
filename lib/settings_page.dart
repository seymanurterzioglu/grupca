import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grupca/constant/theme_color.dart';
import 'package:grupca/constant/theme_notifier.dart';
import 'package:grupca/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedColor = "Yellow";

  final List<String> themeColors = ["Blue", "Dark", "Green", "Yellow"];


  Future<void> onThemeChange(String value, ThemeNotifier themeNotifier) async {
    if (value == "Dark") {
      themeNotifier=themeNotifier.set(darkTheme);
    } else if (value == "Blue") {
      themeNotifier=themeNotifier.set(blueTheme);
    } else if (value == "Yellow") {
      themeNotifier=themeNotifier.set(yellowTheme);
    } else {  //Colors.green
      themeNotifier=themeNotifier.set(greenTheme);
    }

    final pref= await SharedPreferences.getInstance();
    pref.setString("ThemeMode", value);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    themeNotifier.getTheme;
    return DropdownButton<String>(
      value: _selectedColor,
      items: themeColors
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style:
                      TextStyle(fontSize: getProportionateScreenHeight(20)),
                ),
              ))
          .toList(),
      onChanged: (item) {
        setState(() => _selectedColor = item!);

        onThemeChange(_selectedColor,themeNotifier);
      },
    );
  }
}
