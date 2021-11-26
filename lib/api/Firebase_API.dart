import '../model/TaskModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  static Future<String?> createTask(TaskModel taskCloud) async {
    final docTask = FirebaseFirestore.instance.collection('task').doc();
    // It will generate random id
    taskCloud.id = docTask.id;
    await docTask.set(taskCloud.toJson());

    return docTask.id;
  }
}