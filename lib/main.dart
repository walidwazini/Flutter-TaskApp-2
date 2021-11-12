import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './screens/Screen_Home.dart';
import 'provider/TasksProvider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);
  static final String mainTitle = 'Task App ver.2';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xffc11430),
          scaffoldBackgroundColor: Colors.white70,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
