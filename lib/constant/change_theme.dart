import 'package:flutter/material.dart';
import 'package:grupca/constant/theme_data.dart';
import 'package:provider/provider.dart';


class ChangeTheme extends StatelessWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    return Switch.adaptive(value: themeData.isDarkMode,
        onChanged: (value) {
       final provider= Provider.of<ThemeNotifier>(context,listen: false);
       provider.toogleTheme(value);

        });
  }
}
