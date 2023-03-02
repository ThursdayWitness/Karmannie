import 'task.dart';

class Child{
  final String name;
  int money;
  List<Task> tasks = List<Task>.empty(growable: true);

  Child(this.name, this.money);
  Child.withTasks(this.name, this.money, this.tasks);
}