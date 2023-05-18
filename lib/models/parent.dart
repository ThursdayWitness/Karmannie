import 'child.dart';
import 'task.dart';

class Parent {
  late final String name;
  late List<Child> children = List<Child>.empty(growable: true);
  Map<Child, List<Task>> tasks = <Child, List<Task>>{};

  Parent(Map<String, dynamic> dbParent) {
    name = dbParent["name"];
    children = (dbParent["child"]);
    for (var child in children) {
      tasks[child] = child.tasks;
    }
  }
}
