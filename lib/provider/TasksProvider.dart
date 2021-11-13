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
}