import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_data.dart';
import '../../../../../core/dummy_data.dart';
import '../../../data/model/Task.dart';
import 'widgets/Header.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String dateNow = DateFormat('MMM, yy').format(DateTime.now()).toString();

  List<Task> tasks = DummyData.tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: Column(
            children: [
              Header(dateNow: dateNow),

              Text(
                "Tasks",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    Task task = tasks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: task.priority.color,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lightGrey,
                              blurRadius: 5,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    task.description,
                                    style: TextStyle(
                                      color: AppColors.lightGrey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
