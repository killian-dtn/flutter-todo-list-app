import 'package:todolist/models/task.dart';
import 'package:faker/faker.dart';

// Singleton qui génère 15 Tasks
class Tasks {
  final Faker _faker = Faker();
  List<Task>? tasks;

  factory Tasks() => Tasks._internal();

  Tasks._internal() {
    tasks = List.generate(15, (index) => Task(
      index, _faker.lorem.sentence(), false, DateTime.now()
    ));
  }
}
/*
Faker f = Faker();
List<Task> tasks = List.generate(15, (i) => Task(i, f.lorem.sentence(), false, DateTime.now()));
*/
