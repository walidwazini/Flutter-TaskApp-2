class TaskField {
  static const createdTime = 'createdTime';

}

class Task {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Task({
    required this.createdTime,
    required this.title,
    required this.id,
    this.description = '',
    this.isDone = false
});
}