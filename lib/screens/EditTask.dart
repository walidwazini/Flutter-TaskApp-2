import 'package:flutter/material.dart';

import '../widgets/TaskForm.dart';
import '../provider/TasksProvider.dart';
import '../model/TaskModel.dart';

class EditTask extends StatefulWidget {
  //const EditTask({Key? key}) : super(key: key);
  final TaskModel taskToEdit;

  EditTask({ required this.taskToEdit});

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  String? title;
  String? description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    title = widget.taskToEdit.title;
    description = widget.taskToEdit.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TaskForm(
        title: title,
        description: description,
        onChangedDescription:(description) => setState(() => this.description = description),
        onChangedTitle:(title) => setState(() => this.title = title) ,
        onSavedTask:(){} ,
      ),
    );
  }
}
