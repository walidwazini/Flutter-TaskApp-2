import 'package:flutter/material.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Container(), Container()
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(MyApp.mainTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xffc11430).withOpacity(0.6),
        selectedItemColor: Colors.white,
        items: [],
      ),
    );
  }
}
