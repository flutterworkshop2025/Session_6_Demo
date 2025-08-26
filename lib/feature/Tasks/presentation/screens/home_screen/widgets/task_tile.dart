import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../data/model/Task.dart';

class TaskTile extends StatefulWidget {
  Task task;
  TaskTile({super.key, required this.task});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: Row(
        children: [
          Container(
            width: w * 0.13,
            height: w * 0.13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.task.priority.color,
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightGrey,
                  blurRadius: 5,
                  offset: Offset(1, 2),
                ),
              ],
            ),
      
            child: Center(
              child: Text(
                DateFormat("hh:mm a").format(widget.task.dateTime),
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
      
          SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.task.priority.color,
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
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              DateFormat(
                                "E, d-MM-yy",
                              ).format(widget.task.dateTime),
                              style: TextStyle(
                                color: AppColors.light,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.task.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    width: w * 0.48,
                                    child: Text(
                                      widget.task.description,
                                      // softWrap: true,
                                      // overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: AppColors.light,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: widget.task.isComplete,
                                    activeColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {
                                        widget.task.isComplete = value!;
                                      });
                                    },
                                  ),
                                   GestureDetector(
                                    onTap:(){},
                                     child: const Icon(Icons.delete,
                                         color: Colors.white),
                                   ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
