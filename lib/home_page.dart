import 'package:flutter/material.dart';
import 'package:grupca/size_config.dart';
import 'constant/sidebar.dart';

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
      body: const Center(child:  Text("sdfcsdfcdsfksdf")),
    );
  }
}
