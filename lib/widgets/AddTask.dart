import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/TaskModel.dart';
import './TaskForm.dart';
import '../provider/TasksProvider.dart';

class AddTask extends StatefulWidget {
  //const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TaskForm(
              onChangedTitle: (titleEntered) =>
                  setState(() => this.title = titleEntered),
              onChangedDescription: (descriptionEntered) =>
                  setState(() => this.description = descriptionEntered),
              onSavedTask: addTaskHandler,
            ),
          ],
        ),
      ),
    );
  }

  void addTaskHandler() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final task = TaskModel(
        id: Random().nextInt(5000).toString(),
        createdTime: DateTime.now(),
        title: title,
        description: description,
      );

      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.firestoreAddTask(task);

      Navigator.of(context).pop();
    }
  }
}
