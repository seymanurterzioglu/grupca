import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grupca/constant/change_theme.dart';
import 'package:grupca/constant/theme_data.dart';
import 'package:grupca/size_config.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Ayarlar'),
        toolbarHeight: getProportionateScreenHeight(85),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(15)),
        child: ListView(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(60)),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.palette_outlined,
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tema',
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(20),
                          fontWeight: FontWeight.w500)),
                  const ChangeTheme(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
