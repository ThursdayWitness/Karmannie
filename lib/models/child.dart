import 'task.dart';

class Child{
  late String _name;
  String get getName => _name;
  late int _password;
  int _money = 0;
  int get getMoney => _money;
  final List<Task> _tasks = List<Task>.empty(growable: true);
  List<Task> get getTasks => _tasks;

  Child({required String name, required int password})
  {
    _name = name;
    _password = password;
  }

  Child.withTasks({required String name, required int password, required List<Task>tasks})
  {
    _name = name;
    _password = password;
    _tasks.addAll(tasks);
  }

  Child.withOneTask({required String name, required int password, required Task task})
  {
    _name = name;
    _password = password;
    _tasks.add(task);
  }

  void completeTask(Task task)
  {
    _money += task.reward;
    _tasks.remove(task);
  }

  void addTask(name, reward, deadline)
  {
    _tasks.add(Task(name, reward, deadline));
  }
}