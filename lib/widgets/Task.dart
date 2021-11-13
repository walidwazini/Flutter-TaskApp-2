import 'package:flutter/material.dart';

import '../model/TaskModel.dart';

class Task extends StatelessWidget {
  //const Task({Key? key}) : super(key: key);
  final TaskModel task;

  Task({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: task.isDone,
            onChanged: (_){},
          ),
          SizedBox(width: 20,),
          Expanded(child: Column(
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
}
