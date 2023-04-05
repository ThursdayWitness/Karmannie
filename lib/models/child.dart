import 'task.dart';

class Child {
  late String _name;
  String get getName => _name;
  int _money = 0;
  int get getMoney => _money;
  final List<Task> _tasks = List<Task>.empty(growable: true);
  List<Task> get getTasks => _tasks;

  Child({required String name}) {
    _name = name;
  }

  Child.withTasks({required String name, required List<Task> tasks}) {
    _name = name;
    _tasks.addAll(tasks);
  }

  Child.withOneTask({required String name, required Task task}) {
    _name = name;
    _tasks.add(task);
  }

  void completeTask(Task task) {
    _money += task.reward;
    _tasks.remove(task);
  }

  void addTask(name, reward, deadline) {
    _tasks.add(Task(name, reward, deadline));
  }
}
