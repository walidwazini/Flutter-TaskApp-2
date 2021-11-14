import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app_2/provider/TasksProvider.dart';
import '../model/TaskModel.dart';
import '../widgets/Task.dart';

class CompletedList extends StatelessWidget {
  //const CompletedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    final tasks = provider.completedGetter;

    return tasks.isEmpty
        ? Center(child: Text('No completed task.', style: TextStyle(fontSize: 20)))
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
