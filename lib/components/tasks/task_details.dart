import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/task.dart';

class TaskDetails extends StatefulWidget {
  /*final Task? task;
  final ValueSetter<Task?> previewUpdaterCallback;*/
  final Function(Function(Task?, Function(Task?)?)) detailsUpdaterInitCallback;
  static const double allPadding = 10;
  static const double datePadding = 20;

  const TaskDetails({Key? key, required this.detailsUpdaterInitCallback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  Task? _task;
  Function(Task?)? previewUpdaterCallback;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => widget.detailsUpdaterInitCallback(
        (task, callback) => setState(() {
          _task = task;
          previewUpdaterCallback = callback;
        })
    ));
    /*widget.detailsUpdaterInitCallback(
      // details updater callback triggered inside previews
      (Task? task, Function(Task?)? callback) => setState(() {
        _task = task;
        previewUpdaterCallback = callback;
      })
    );*/
  }

  //void updateTaskCallback(Task? task) => setState(() => _task = task);

  ListTile _listTileChild() => ListTile(
    title: Text("Task " + _task!.id.toString()),
    subtitle: Padding(
      padding: const EdgeInsets.only(top: TaskDetails.allPadding),
      child: Text(_task!.content)),
    leading: SizedBox(height: double.infinity, child: Icon(
      _task!.completed ? Icons.task_alt : Icons.highlight_remove,
      color: _task!.completed ? Colors.lightGreen : Colors.redAccent,
    )),
  );

  RichText _dateTextChild() => RichText(
    textAlign: TextAlign.right,
    text: TextSpan(
      text: DateFormat("dd/MM/yyyy hh:mm").format(_task!.createdAt),
      style: const TextStyle(color: Colors.grey),
    ),
  );

  Row _buttonsMenu() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      TextButton(
          onPressed: () {
            setState(() => _task!.completed = !(_task!.completed));
            previewUpdaterCallback!(_task);
          },
          child: Text(_task!.completed ? "UNCHECK" : "CHECK")
      ),
      TextButton(
          onPressed: () { },
          child: const Text("EDIT")
      ),
      IconButton(
          onPressed: () => setState(() => _task = null),
          icon: const Icon(Icons.close, color: Colors.grey)
      )
    ],
  );

  @override
  Widget build(BuildContext context) => _task == null || previewUpdaterCallback == null ? const SizedBox.shrink() : Center(child: Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(
                top: TaskDetails.allPadding,
                bottom: TaskDetails.allPadding
            ),
            child: _listTileChild()
        ),
        Padding(
            padding: const EdgeInsets.only(
              left: TaskDetails.datePadding,
              right: TaskDetails.datePadding,
              top: TaskDetails.allPadding,
              //bottom: allPadding
            ),
            child: SizedBox(width: double.infinity, child: _dateTextChild())
        ),
        Padding(padding: const EdgeInsets.all(TaskDetails.allPadding), child: _buttonsMenu())
      ],
    ),
  ));

}
