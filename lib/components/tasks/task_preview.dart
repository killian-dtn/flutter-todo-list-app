import 'package:flutter/material.dart';

import '../../models/task.dart';

class TaskPreview extends StatelessWidget {
  final Task task;

  const TaskPreview({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(task.content),
      leading: Icon(
      task.completed ? Icons.task_alt : Icons.highlight_remove,
      color: task.completed ? Colors.lightGreen : Colors.redAccent
    )
  );
}