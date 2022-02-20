import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';

class TaskPreview extends StatelessWidget {
  final Task task;

  const TaskPreview({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    child: RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              task.completed ? Icons.task_alt : Icons.highlight_remove,
              size: 14,
              color: task.completed ? Colors.lightGreen : Colors.redAccent
            )
          ),
          TextSpan(text: task.content),
        ]
      )
    )
  );

}