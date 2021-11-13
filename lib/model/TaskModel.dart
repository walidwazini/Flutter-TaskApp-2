class TaskField {
  static const createdTime = 'createdTime';

}

class TaskModel {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  TaskModel({
    required this.createdTime,
    required this.title,
    required this.id,
    this.description = '',
    this.isDone = false
});
}