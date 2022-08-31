import 'package:flutter/material.dart';
import 'package:grupca/constant/button.dart';
import 'package:grupca/constant/size_config.dart';
import 'package:grupca/constant/slider.dart';
import 'package:grupca/theme_data.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  List images = ['keyboard1.jpg', 'keyboard2.jpg', 'keyboard3.jpg'];

  DetailPage({Key? key, required this.images}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_new_outlined)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenHeight(20),
                  right: getProportionateScreenHeight(20),
                ),
                child: Stack(
                  children: [
                    ImageSlider(items: widget.images),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                'Logitech POP Keys Kablosuz Mekanik Emoji Klavyesi',
                style: TextStyle(fontSize: getProportionateScreenHeight(20)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: getProportionateScreenHeight(120),
        padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(getProportionateScreenHeight(20)),
              topRight: Radius.circular(getProportionateScreenHeight(20))),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenHeight(30),
              right: getProportionateScreenHeight(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1749 TL',
                style: TextStyle(fontSize: getProportionateScreenHeight(25),color: Colors.black),
              ),
              SizedBox(
                width: getProportionateScreenHeight(200),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: themeData.isDarkMode
                        ? Colors.purple
                        : Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Satın Al',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
