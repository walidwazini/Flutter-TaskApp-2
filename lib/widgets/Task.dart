import 'package:flutter/material.dart';

import '../model/TaskModel.dart';

class Task extends StatelessWidget {
  //const Task({Key? key}) : super(key: key);
  final TaskModel task;

  Task({required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: task.isDone,
          onChanged: (_){},
        )
      ],
    );
  }
}
