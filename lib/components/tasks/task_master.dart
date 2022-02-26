import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';
import 'task_preview.dart';

class TaskMaster extends StatelessWidget {
  List<Task>? data;
  final Function(Task? task, Function(Task?) callback) onPreviewTapCallback;

  TaskMaster({ Key? key, required this.data, required this.onPreviewTapCallback }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(child: ListView.separated(
    itemCount: data!.length,
    itemBuilder: (context, i) => TaskPreview(task: data![i], onTapCallback: onPreviewTapCallback),
    separatorBuilder: (context, i) => const Divider(),
  ));
}