import 'child.dart';
import 'task.dart';

class Parent {
  late final String name;
  late List<Child> children = List<Child>.empty(growable: true);
  late List<Task> tasks = List<Task>.empty(growable: true);

  Parent(Map<String, dynamic> dbParent) {
    name = dbParent["name"];
    children = (dbParent["child"]);
    for(var child in children)
      {
        tasks.addAll(child.tasks);
      }
  }
}
