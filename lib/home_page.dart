import 'package:flutter/material.dart';
import 'constant/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
        title: const Text("Grupca"),
      ),
      body: const Center(child:  Text("sdfcsdfcdsfksdf")),
    );
  }
}
