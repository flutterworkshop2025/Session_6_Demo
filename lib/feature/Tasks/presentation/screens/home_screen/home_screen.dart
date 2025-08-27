import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/dummy_data.dart';
import '../../../data/model/Priority.dart';
import '../../../data/model/Task.dart';
import 'widgets/Header.dart';
import 'widgets/add_task_widgets/add_task_dialog.dart';
import 'widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String dateNow = DateFormat('MMM, yy').format(DateTime.now()).toString();

  List<Task> tasks = DummyData.tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final _titleController = TextEditingController();
              final _descController = TextEditingController();
              DateTime? selectedDateTime;
              Priority? selectedPriority;
              return AddTaskDialog(
                titleController: _titleController,
                descController: _descController,
                selectedDateTime: selectedDateTime,
                selectedPriority: selectedPriority,
              );
            },
          );
        },
        backgroundColor: AppColors.mainColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: Column(
            children: [Header(dateNow: dateNow), TasksList(tasks: tasks)],
          ),
        ),
      ),
    );
  }
}
