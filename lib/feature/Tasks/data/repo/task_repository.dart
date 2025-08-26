import 'package:hive_flutter/hive_flutter.dart';
import '../model/Task.dart';

class TaskRepository {
  final Box<Task> taskBox;

  const TaskRepository({required this.taskBox});

  List<Task> getTasks() => taskBox.values.toList();

  Future<void> addTask(Task task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> updateTask(Task task) async {
    await addTask(task);
  }

  Future<void> deleteTask(int id) async {
    await taskBox.delete(id);
  }

  Future<Task?> getTaskById(int id) async {
    return taskBox.getAt(id);
  }
}
