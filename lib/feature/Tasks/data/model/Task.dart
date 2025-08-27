import 'Priority.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'Task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime dateTime;
  @HiveField(4)
  bool isComplete;
  @HiveField(5)
  Priority priority;

  static int count = 0;

  Task({
    int? id,
    required this.title,
    this.description = '',
    required this.dateTime,
    required this.isComplete,
    required this.priority,
  }) : id = id ?? count++;
}
