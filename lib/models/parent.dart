import 'dart:math';

import 'child.dart';

class Parent {
  final String name;
  final List<Child> children;

  Parent(this.name, this.children);

  void createChild(String name) {
    children.add(Child(name: name));
  }

  void createTask(Child child, String name, int reward, DateTime deadline) {
    child.addTask(name, reward, deadline);
  }

  int generateChildCode() {
    return Random.secure().nextInt(89999) + 10000; // от 10000 до 99999
  }
}
