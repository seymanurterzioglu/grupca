import 'dart:async';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
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
  String _selectedColor = "Green";

  final List<String> themeColors = ["Blue", "Dark", "Green", "Yellow"];

  Future<void> onThemeChange(String value, ThemeNotifier themeNotifier) async {
    if (value == "Dark") {
      themeNotifier = themeNotifier.set(darkTheme);
    } else if (value == "Blue") {
      themeNotifier=themeNotifier.set(blueTheme);
    } else if (value == "Yellow") {
      themeNotifier = themeNotifier.set(yellowTheme);
    } else if (value == "Green") {
      themeNotifier = themeNotifier.set(greenTheme);
    } else {
      themeNotifier = themeNotifier.set(yellowTheme);
    }

    final pref = await SharedPreferences.getInstance();
    pref.setString("ThemeMode", value);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    themeNotifier.getTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              const Icon(
                Icons.person,
                color: Colors.black,
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              const Text(
                'Tema',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(height: getProportionateScreenHeight(25), thickness: 2),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildAccountOption(context, 'Tema Değiştir',themeNotifier),
          // Row(
          //   children: [
          //     Center(
          //       child: DropdownButton<String>(
          //         value: _selectedColor,
          //         items: themeColors
          //             .map((item) => DropdownMenuItem<String>(
          //                   value: item,
          //                   child: Text(
          //                     item,
          //                     style:
          //                         TextStyle(fontSize: getProportionateScreenHeight(20)),
          //                   ),
          //                 ))
          //             .toList(),
          //         onChanged: (item) {
          //           setState(() => _selectedColor = item!);
          //
          //           onThemeChange(_selectedColor, themeNotifier);
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title,ThemeNotifier themeNotifier) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(title),
              content: Container(
                height: getProportionateScreenHeight(200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RadioGroup<String>.builder(
                        groupValue: _selectedColor,
                        onChanged: (val){
                          setState((){
                            _selectedColor=val!;
                          });
                          onThemeChange(_selectedColor,themeNotifier);
                        },
                        items: themeColors,
                        itemBuilder: (item) => RadioButtonBuilder(item))
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      onThemeChange(_selectedColor,themeNotifier);
                      Navigator.of(context).pop();
                    },
                    child: Text('Kapat'))
              ],
            );
          }),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(25),
            vertical: getProportionateScreenWidth(9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black38,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black38),
          ],
        ),
      ),
    );
  }
}
