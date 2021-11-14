import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/TaskForm.dart';
import '../provider/TasksProvider.dart';
import '../model/TaskModel.dart';

class EditTask extends StatefulWidget {
  //const EditTask({Key? key}) : super(key: key);
  final TaskModel taskToEdit;

  EditTask({required this.taskToEdit});

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _formKey = GlobalKey<FormState>();

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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              final provider = Provider.of<TasksProvider>(context, listen: false);
              provider.removeTask(widget.taskToEdit);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TaskForm(
            title: title,
            description: description,
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onChangedTitle: (title) => setState(() => this.title = title),
            onSavedTask: updateTaskHandler,
          ),
        ),
      ),
    );
  }

  void updateTaskHandler() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.updateTask(widget.taskToEdit, title!, description!);

      Navigator.of(context).pop();
    }
  }
}
