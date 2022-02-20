import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';
import 'task_preview.dart';

class TaskMaster extends StatelessWidget {
  List<Task>? data;

  TaskMaster({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: data!.length,
    itemBuilder: (context, i) => TaskPreview(task: data![i]),
  );
}