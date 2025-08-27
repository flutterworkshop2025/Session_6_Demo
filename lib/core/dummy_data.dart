import '../feature/Tasks/data/model/priority_level.dart';
import '../feature/Tasks/data/model/Task.dart';
import '../feature/quote/data/model/qoute.dart';
import 'app_data.dart';

class DummyData {
  static List<Task> tasks = [
    Task(
      title: "Study BLoC Cubit",
      dateTime: DateTime(2025, 8, 22, 12, 50),
      isComplete: false,
      priority: Data.priorities[PriorityLevel.high]!,
    ),

    Task(
      title: "Final Project",
      dateTime: DateTime(2025, 9, 22, 11, 59),
      isComplete: false,
      priority: Data.priorities[PriorityLevel.high]!,
      description: "Final Project for Minders Flutter Workshop :)",
    ),

    Task(
      title: "Relaxing",
      dateTime: DateTime(2025, 9, 22, 11, 59),
      isComplete: false,
      priority: Data.priorities[PriorityLevel.low]!,
      description: "No Time",
    ),

    Task(
      title: "Eating",
      dateTime: DateTime(2025, 9, 22, 11, 59),
      isComplete: false,
      priority: Data.priorities[PriorityLevel.moderate]!,
    ),
  ];

  static final List<Qoute> qoutes = [
    Qoute(
      content:
          "The client who pays you your complete salary, he is your master and you ar hi slave",
      author: "Dr. El Ramly",
    ),
    Qoute(
      content:
          "The client who pays you your complete salary, he is your master and you ar hi slave",
      author: "Dr. El Ramly",
    ),Qoute(
      content:
          "The client who pays you your complete salary, he is your master and you ar hi slave",
      author: "Dr. El Ramly",
    ),
  ];
}
