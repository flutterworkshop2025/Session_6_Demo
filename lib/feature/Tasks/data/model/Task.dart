
import 'Priority.dart';

class Task {
  String title;
  String description;
  DateTime dateTime;
  bool isComplete;
  Priority priority;
  
  Task({
    required this.title,
    this.description ='',
    required this.dateTime,
    required this.isComplete,
    required this.priority,
  });

}
