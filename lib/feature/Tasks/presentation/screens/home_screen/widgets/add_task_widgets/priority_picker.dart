import 'package:flutter/material.dart';

import '../../../../../../../core/app_colors.dart';
import '../../../../../../../core/app_data.dart';
import '../../../../../data/model/Priority.dart';
import '../../../../../data/model/priority_level.dart';

class PriorityPicker extends StatefulWidget {
  Priority? selectedPriority;
  PriorityPicker({super.key, required this.selectedPriority});

  @override
  State<PriorityPicker> createState() => _PriorityPickerState();
}

class _PriorityPickerState extends State<PriorityPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Priority:"),
        RadioListTile<Priority>(
          title: Text(
            "High",
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          value: Data.priorities[PriorityLevel.high]!,
          groupValue: widget.selectedPriority,
          onChanged: (value) => setState(() => widget.selectedPriority = value),
        ),
        RadioListTile<Priority>(
          title: Text(
            "Moderate",
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          value: Data.priorities[PriorityLevel.moderate]!,
          groupValue: widget.selectedPriority,
          onChanged: (value) => setState(() => widget.selectedPriority = value),
        ),
        RadioListTile<Priority>(
          title: Text(
            "Low",
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          value: Data.priorities[PriorityLevel.low]!,
          groupValue: widget.selectedPriority,
          onChanged: (value) => setState(() => widget.selectedPriority = value),
        ),
      ],
    );
  }
}
