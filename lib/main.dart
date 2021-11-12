import 'package:flutter/material.dart';

import './screens/Screen_Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);
  static final String mainTitle = 'Task App ver.2';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffc11430),
        scaffoldBackgroundColor: Colors.white70,
      ),
      home: HomeScreen(),
    );
  }
}
