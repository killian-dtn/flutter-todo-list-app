import 'package:flutter/material.dart';

import '../../models/task.dart';

class TaskDetails extends StatelessWidget {
  final Task task;

  const TaskDetails({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(child: Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: const Text("Task"),
          subtitle: Text(task.content),
          leading: Icon(
            task.completed ? Icons.add_task : Icons.highlight_remove,
            color: task.completed ? Colors.lightGreen : Colors.redAccent
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Created at " + task.content),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () { },
                  child: const Text("COMPLETE")
                ),
                TextButton(
                  onPressed: () { },
                  child: const Text("EDIT")
                )
              ],
            )
          ],
        )
      ],
    ),
  ));

}
/*
class TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) => const Center(child: Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: )
      ],
    ),
  ));
}*/