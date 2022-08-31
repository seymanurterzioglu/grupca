import 'package:flutter/material.dart';
import 'package:grupca/constant/size_config.dart';
import 'sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // for the work with sizeconfig
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text("Grupca"),
        toolbarHeight: getProportionateScreenHeight(85),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body:Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 const Icon(
                  Icons.error,
                  size: 64,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'Burası giriş sayfasıdır. Kullanıcıyı karşılayan ilk ekrandır.',
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
