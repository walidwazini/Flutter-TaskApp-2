import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/Task.dart';
import '../provider/TasksProvider.dart';

class TaskList extends StatelessWidget {
  //const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    final tasks = provider.tasksGetter;

    return tasks.isEmpty
        ? Center(child: Text('No task ', style: TextStyle(fontSize: 20)))
        : ListView.separated(
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(12),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Task(task: task);
            },
          );
  }
}
