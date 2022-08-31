import 'package:flutter/material.dart';
import 'package:grupca/theme_data.dart';
import 'package:grupca/constant/size_config.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(60),
      child: ElevatedButton(
        onPressed: press as void Function()?,
        style: ElevatedButton.styleFrom(
          primary: themeData.isDarkMode ? Colors.purple : Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(25),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}