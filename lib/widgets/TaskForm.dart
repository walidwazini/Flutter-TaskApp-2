import 'package:flutter/material.dart';

class TaskForm extends StatelessWidget {
  //const TaskForm({Key? key}) : super(key: key);
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTask;

  TaskForm({
    this.title,
    this.description,
    required this.onChangedDescription,
    required this.onChangedTitle,
    required this.onSavedTask,
});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        buildTitle(),
      ],),
    );
  }

  Widget buildTitle() => TextFormField(
    initialValue: title,
    validator: (title){
      if (title!.isEmpty) {
        return 'Title cannot be empty';
      }
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title',
    ),
  );

}
