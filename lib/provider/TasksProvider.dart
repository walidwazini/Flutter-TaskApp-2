import 'package:flutter/material.dart';
import 'package:task_app_2/api/Firebase_API.dart';
import 'dart:math';

import '../model/TaskModel.dart';

class TasksProvider extends ChangeNotifier {
  var randomId = Random();
  List<TaskModel> _tasks = [];

  List<TaskModel> get tasksGetter =>
      _tasks.where((task) => (task.isDone == false)).toList();

  List<TaskModel> get completedGetter =>
      _tasks.where((taskGiven) => (taskGiven.isDone == true)).toList();

  // For install data local storage
  void setLocalTasks(List<TaskModel> localTasks) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _tasks = localTasks;
      notifyListeners();
    });
  }

  void firestoreAddTask(TaskModel task) {
    FirebaseApi.createTask(task);
  }

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }

  bool? toggleTaskStatus(TaskModel task) {
    task.isDone = !task.isDone;
    notifyListeners();

    return task.isDone;
  }

  void updateTask(TaskModel taskEdit, String newTitle, String newDescription) {
    taskEdit.title = newTitle;
    taskEdit.description = newDescription;
    notifyListeners();
  }
}
