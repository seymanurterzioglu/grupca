import 'package:flutter/material.dart';
import 'package:grupca/size_config.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Profil'),
        toolbarHeight: getProportionateScreenHeight(85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          top(),
          content(),
        ],
      ),
    );
  }

  Widget top() => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 144/2),
                child: Opacity(opacity: 0.2, child: coverImage())),
          ),
          Positioned(top: 280 - 184 / 2, child: profilImage()),
        ],
      );

  Widget content() => Container(
    alignment: Alignment.center,
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(48)),
        child: Column(
          children: [
            Text(
              'Nickname',
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(28),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Text(
              'Canı çabuk sıkılan biriyim.',
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(14), height: 1.4),
            )
          ],
        ),
      );

  Widget coverImage() => Container(
        height: 280,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/profilBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        // child: Image.asset(
        //   "assets/profilBackground.jpg",
        //   width: double.infinity,
        //   height: 280,
        //   fit: BoxFit.cover,
        // ),
      );

  Widget profilImage() => const CircleAvatar(
        radius: 164 / 2,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 154/2,
          backgroundImage: AssetImage("assets/images.png"),
        ),
      );
}
