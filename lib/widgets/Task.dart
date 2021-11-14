import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../provider/TasksProvider.dart';
import '../model/TaskModel.dart';
import '../Utils.dart';

class Task extends StatelessWidget {
  //const Task({Key? key}) : super(key: key);
  final TaskModel task;

  Task({required this.task});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Slidable(
          key: Key(task.id),
          startActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Color(0xFF38E248),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed: (_) {},
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) => deleteTaskHandler(context, task),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              )
            ],
          ),
          child: buildTask(context),
        ),
      );

  Widget buildTask(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: task.isDone,
            onChanged: (_) {
              final provider =
                  Provider.of<TasksProvider>(context, listen: false);
              final isDone = provider.toggleTaskStatus(task);

              Utils.showSnackBar(context,
                  isDone! ? 'One task completed.' : 'Task marked as incomplete',
                  Colors.green,
              );
            },
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                ),
              ),
              if (task.description.isNotEmpty)
                Container(
                  child: Text(
                    task.description,
                    style: TextStyle(fontSize: 18, height: 1.5),
                  ),
                )
            ],
          ))
        ],
      ),
    );
  }

  void deleteTaskHandler(BuildContext ctx, TaskModel task) {
    final provider = Provider.of<TasksProvider>(ctx, listen: false);
    provider.removeTask(task);

    Utils.showSnackBar(ctx, 'One task DELETED', Colors.red);
  }
}
