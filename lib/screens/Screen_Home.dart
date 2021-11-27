import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app_2/api/Firebase_API.dart';
import 'package:task_app_2/model/TaskModel.dart';
import 'package:task_app_2/provider/TasksProvider.dart';

import '../main.dart';
import '../widgets/AddTask.dart';
import '../widgets/TaskList.dart ';
import '../widgets/CompletedList.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TaskList(),
      CompletedList()
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(MyApp.mainTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xff660000),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (selection) => setState(() {
          selectedIndex = selection;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Pending'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28,),
              label: 'Completed'
          )
        ],
      ),
      body: StreamBuilder<List<TaskModel>>(
        stream: FirebaseApi.readTasks(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError){
                return Center(child: Text('Something went wrong!'));
              } else {
                final tasks = snapshot.data;
                final provider = Provider.of<TasksProvider>(context);
                provider.setLocalTasks(tasks!);
                return tabs[selectedIndex];
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AddTask(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
