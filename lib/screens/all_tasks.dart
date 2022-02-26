import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks.dart';

import '../models/task.dart';

class AllTasks extends StatefulWidget {
  final Tasks tasksData = Tasks();

  AllTasks({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Function(Task?, Function(Task?)?)? detailsUpdaterCallback;

  initDetailsCallbackCallback(Function(Task?, Function(Task?)?) callback) =>
    setState(() => detailsUpdaterCallback = callback);

  onPreviewTapCallback(Task? task, Function(Task?) callback) {
    detailsUpdaterCallback!(task, callback);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("All tasks")),
    body: Column(
      children: <Widget>[
        TaskDetails(
          detailsUpdaterInitCallback: (cb) => setState(() => detailsUpdaterCallback = cb)
        ),
        TaskMaster(
          data: widget.tasksData.tasks,
          onPreviewTapCallback: onPreviewTapCallback
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () { },
      child: const Icon(Icons.add)
    )
  );
}
