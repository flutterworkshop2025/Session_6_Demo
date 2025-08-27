import 'package:demo/feature/Tasks/data/repo/task_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/Priority.dart' show Priority;
import '../../data/model/Task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TasksBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repo;
  TasksBloc(this.repo) : super(TaskInitial()) {
    on<TaskLoad>((event, emit) {
      emit(TaskLoading());
      try {
        final tasks = repo.getTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    on<TaskAdd>((event, emit) async {
      try {
        final task = Task(
          title: event.title,
          description: event.description,
          isComplete: false,
          priority: event.priority,
          dateTime: event.dateTime,
        );
        await repo.addTask(task);
        final tasks = repo.getTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    on<TaskToggle>((event, emit) async {
      try {
        final tasks = repo.getTasks();
        final task = tasks.firstWhere((t) => t.id == event.id);
        final updatedTask = Task(
          id: task.id,
          title: task.title,
          dateTime: task.dateTime,
          isComplete: !task.isComplete,
          priority: task.priority,
        );
        await repo.updateTask(updatedTask);
        emit(TaskLoaded(repo.getTasks()));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
    
    on<TaskDelete>((event, emit) async {
      try {
        await repo.deleteTask(event.id);
        emit(TaskLoaded(repo.getTasks()));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
  }
}
