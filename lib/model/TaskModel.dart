import 'package:task_app_2/Utils.dart';

class TaskField {
  static const createdTime = 'createdTime';
}

class TaskModel {
  String id;
  DateTime? createdTime;
  String title;
  String description;
  bool isDone;

  TaskModel(
      {required this.id,
      required this.createdTime,
      required this.title,
      this.description = '',
      this.isDone = false});

  // To SEND data to Firebase Firestore
  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };

  // To GET data from Firestore
  static TaskModel fromJson(Map<String, dynamic> json) => TaskModel(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );
}
