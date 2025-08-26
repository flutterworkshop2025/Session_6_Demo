part of 'task_bloc.dart';

@immutable
sealed class TaskEvent extends Equatable {
  @override
  List<Object> get props => [];

  const TaskEvent();
}

class TaskLoad extends TaskEvent {}

class TaskAdd extends TaskEvent {
  final String title;
  final String description;
  final Priority priority;
  final DateTime dateTime;

  const TaskAdd(this.title, this.description, this.priority, this.dateTime);
  @override
  List<Object> get props => [title];
}

class TaskToggle extends TaskEvent {
  final int id;
  const TaskToggle(this.id);

  @override
  List<Object> get props => [id];
}

class TaskDelete extends TaskEvent {
  final int id;
  const TaskDelete(this.id);

  @override
  List<Object> get props => [id];
}
