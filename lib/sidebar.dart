import 'package:flutter/material.dart';
import 'package:grupca/home_page.dart';
import 'package:grupca/pages/credit_card.dart';
import 'package:grupca/pages/detail_page.dart';
import 'package:grupca/pages/syncFusion/syncFusion_main.dart';
import 'package:grupca/theme_data.dart';
import 'package:grupca/pages/profil.dart';
import 'package:grupca/pages/settings_page.dart';
import 'package:grupca/pages/sign_in.dart';
import 'package:grupca/constant/size_config.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    SizeConfig().init(context); //sizeConfig kullanmak için bu gerekli
    return Drawer(
      backgroundColor:
          themeData.isDarkMode ? Colors.black54 : Colors.orangeAccent,
      child: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          const DrawerHeader(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: CircleAvatar(
                radius: 144 / 2,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 144 / 2,
                  backgroundImage: AssetImage("assets/images.png"),
                ),
              ),
            ),
          ),
          ListItem(
            icon: Icons.person_pin_sharp,
            text: 'Profil',
            onPress: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profil()),
              );
            },
          ),
          ListItem(
            icon: Icons.settings,
            text: 'Ayarlar',
            onPress: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
                //MaterialPageRoute(builder: (context) => ProfileEdit()),
              );
            },
          ),
          ListItem(
            icon: Icons.call_to_action,
            text: 'Kredi Kart',
            onPress: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreditCard()),
              );
            },
          ),
          ListItem(
            icon: Icons.gite,
            text: 'Giriş',
            onPress: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
                //MaterialPageRoute(builder: (context) => ProfileEdit()),
              );
            },
          ),
          ListItem(
            icon: Icons.inbox_rounded,
            text: 'Detay',
            onPress: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(images: [
                    'assets/keyboard1.jpg',
                    'assets/keyboard2.jpg',
                    'assets/keyboard3.jpg'
                  ]),
                ),
              );
            },
          ),
          ListItem(
            icon: Icons.auto_graph,
            text: 'SyncFusion',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SyncFusion()),
                //MaterialPageRoute(builder: (context) => ProfileEdit()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final bool? hasNavigation;
  final VoidCallback? onPress;

  const ListItem({
    Key? key,
    this.icon,
    required this.text,
    this.hasNavigation = true,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    return Container(
      height: getProportionateScreenHeight(45),
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20))
          .copyWith(bottom: getProportionateScreenHeight(20)),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(30)),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: getProportionateScreenWidth(22),
          ),
          SizedBox(width: getProportionateScreenWidth(5)),
          TextButton(
            onPressed: onPress,
            child: Text(
              text,
              style: TextStyle(
                color: themeData.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: getProportionateScreenHeight(17),
              ),
            ),
          ),
          const Spacer(),
          if (hasNavigation!)
            Icon(
              Icons.chevron_right,
              size: getProportionateScreenWidth(25),
            ),
        ],
      ),
    );
  }
}
