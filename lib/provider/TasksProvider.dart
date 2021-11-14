import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/Task.dart';
import '../model/TaskModel.dart';

class TasksProvider extends ChangeNotifier {
  var randomId = Random();
  List<TaskModel> _tasks = [
    TaskModel(
      id: Random().toString(),
      createdTime: DateTime.now(),
      title: 'Pegi Bengkel',
    ),
    TaskModel(
      id: 2.toString(),
      createdTime: DateTime.now(),
      title: 'Beli pencuci muka',
      description: 'Usha dulu mana yg murah'
    ),
  ];

  List<TaskModel> get tasksGetter => _tasks.where((task) => (task.isDone == false)).toList();
  List<TaskModel> get completedGetter => _tasks.where((taskGiven) => (taskGiven.isDone == true)).toList( ) ;


  void addTask(TaskModel task){
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(TaskModel task){
    _tasks.remove(task);
    notifyListeners();
  }

  bool? toggleTaskStatus(TaskModel task){
    task.isDone = !task.isDone;
    notifyListeners();

    return task.isDone;
  }

}