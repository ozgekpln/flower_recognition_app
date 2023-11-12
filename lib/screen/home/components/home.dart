import 'package:flowers/sabit_degerler.dart';
import 'package:flowers/screen/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: buildAppBar(),
      body: Body(),
      //bottomNavigationBar: const bottomnavigationbar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        backgroundColor: renk1);
  }
}
