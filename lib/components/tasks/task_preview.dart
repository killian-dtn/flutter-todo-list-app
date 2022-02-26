import 'package:flutter/material.dart';

import '../../models/task.dart';

class TaskPreview extends StatefulWidget {
  final Task task;
  final Function(Task?, Function(Task?)) onTapCallback;

  const TaskPreview({ Key? key, required this.task, required this.onTapCallback }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  late Task _task;

  @override
  void initState() {
    super.initState();
    setState(() => _task = widget.task);
  }

  @override
  Widget build(BuildContext context) => ListTile(
      title: Text(_task.content),
      leading: Icon(
          _task.completed ? Icons.task_alt : Icons.highlight_remove,
          color: _task.completed ? Colors.lightGreen : Colors.redAccent
      ),
      onTap: () => widget.onTapCallback(
          _task,
          // Task preview updater triggered in task details
          (task) => setState(() => _task = task!))//callback(task),
  );
}