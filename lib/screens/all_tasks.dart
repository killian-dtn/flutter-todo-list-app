import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks.dart';

class AllTasks extends StatefulWidget {
  final Tasks tasksData = Tasks();

  AllTasks({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AllTasksState();
}

class AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("All tasks")),
    body: TaskMaster(data: widget.tasksData.tasks),
  );
}
