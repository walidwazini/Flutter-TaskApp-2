import 'package:flutter/material.dart';

import './TaskForm.dart';

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
      content: Column(
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
          SizedBox(height: 8,),
          TaskForm(
            onChangedTitle: (titleEntered) => setState(() => this.title = titleEntered),
            onChangedDescription: (descriptionEntered) => setState(() => this.description = descriptionEntered),
            onSavedTask: (){},
          ),
        ],
      ),
    );
  }
}
