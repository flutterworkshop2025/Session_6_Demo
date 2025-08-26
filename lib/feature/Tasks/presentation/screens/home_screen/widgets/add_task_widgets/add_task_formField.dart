import 'package:demo/core/app_colors.dart';
import 'package:flutter/material.dart';

class AddTaskFormField extends StatelessWidget {
  const AddTaskFormField({
    super.key,
    required this.controller,
    required this.title,
  });

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.mainColor,
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          title,
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
      ),
    );
  }
}
