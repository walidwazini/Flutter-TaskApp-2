import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app_2/model/TaskModel.dart';

import '../widgets/Task.dart';

class TaskList extends StatelessWidget {
  //const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Task(
      task: TaskModel(
        createdTime: DateTime.now(),
        title: 'Pegi Bengkel',
        id: 1.toString(),
      ),
    );
  }
}
