import 'package:flutter/material.dart';

import '../../../../../../../core/app_colors.dart';
import '../../../../../data/model/Priority.dart';
import 'add_task_formField.dart';
import 'date_time_widget.dart';
import 'priority_picker.dart';

class AddTaskDialog extends StatelessWidget {
  AddTaskDialog({
    super.key,
    required this.titleController,
    required this.descController,
    required this.selectedDateTime,
    required this.selectedPriority,
  });

  final titleController;
  final descController;
  DateTime? selectedDateTime;
  Priority? selectedPriority;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add Task",
        style: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            child: Column(
              children: [
                AddTaskFormField(
                  controller: titleController,
                  title: "Title",
                ),
                SizedBox(height: 10),
                AddTaskFormField(
                  controller: descController,
                  title: "Description",
                ),

                DateTimeWidget(selectedDateTime: selectedDateTime),
                const SizedBox(height: 12),

               PriorityPicker(selectedPriority:selectedPriority)],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: TextStyle(color: AppColors.mainColor)),
        ),
        TextButton(
          onPressed: () {
            // handle add logic
            Navigator.pop(context);
          },
          child: Text("Add", style: TextStyle(color: AppColors.mainColor)),
        ),
      ],
    );
  }
}
