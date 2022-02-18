import 'package:flutter/material.dart';
import 'package:todolist/screens/all_tasks.dart';

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MaterialApp(home: AllTasks()),
    );
  }
}