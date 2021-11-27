import 'dart:async';

import 'package:task_app_2/Utils.dart';

import '../model/TaskModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  static Future<String?> createTask(TaskModel taskCloud) async {
    final docTask = FirebaseFirestore.instance.collection('task').doc();
    // It will generate random id
    taskCloud.id = docTask.id;
    // Firebase did not understand dart language, need to convert to Json
    await docTask.set(taskCloud.toJson());

    return docTask.id;
  }

  static Stream<List<TaskModel>> readTasks() => FirebaseFirestore.instance
      .collection('todo')
      .orderBy(TaskField.createdTime, descending: true)
      .snapshots()
      // Transform query snapshot to TaskModel object
      .transform(Utils.transformer(TaskModel.fromJson) as StreamTransformer<
          QuerySnapshot<Map<String, dynamic>>, List<TaskModel>>);
}
