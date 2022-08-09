import 'package:flutter/material.dart';
import 'package:grupca/settings_page.dart';
import 'package:grupca/size_config.dart';



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
    SizeConfig().init(context); //sizeConfig kullanmak için bu gerekli
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          ListItem(
            icon: Icons.settings,
            text: 'Ayarlar',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
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
    return Container(
      height: getProportionateScreenHeight(30),
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(35))
          .copyWith(bottom: getProportionateScreenHeight(20)),
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
        color: Colors.white10,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: getProportionateScreenWidth(15),
          ),
          SizedBox(width: getProportionateScreenWidth(5)),
          TextButton(
            onPressed: onPress,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: getProportionateScreenHeight(13),
              ),
            ),
          ),
          const Spacer(),
          if (hasNavigation!)
            Icon(
              Icons.chevron_right,
              size: getProportionateScreenWidth(20),
            ),
        ],
      ),
    );
  }
}
