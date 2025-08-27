import 'package:demo/feature/Tasks/data/repo/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'feature/Tasks/data/model/Task.dart';
import 'feature/Tasks/presentation/screens/home_screen/home_screen.dart';
import 'feature/Tasks/view_model/bloc/task_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing hive for flutter
  await Hive.initFlutter();
  // registering the task adapter to be to store
  Hive.registerAdapter(TaskAdapter());

  // Opening the box for the task,
  //creates a file that stores data in it
  final taskBox = await Hive.openBox<Task>("tasks");
  // Dependency injection
  final taskRepo = TaskRepository(taskBox: taskBox);

  runApp(MyApp(taskRepo: taskRepo));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.taskRepo});

  final TaskRepository taskRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: taskRepo,
      child: BlocProvider(
        create:
            (context) =>
                TasksBloc(RepositoryProvider.of<TaskRepository>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          title: 'Flutter Demo',
          home: HomeScreen(),
        ),
      ),
    );
  }
}
