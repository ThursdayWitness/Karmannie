import 'task.dart';
import 'child.dart';

class Parent{
  final String name;
  final String login;
  final String password;
  final List<Child> children;

  Parent(this.name, this.login, this.password, this.children);

  void createChild(String name, int password)
  {
    children.add(Child(name: name, password: password));
  }

  void createTask(Child child, String name, int reward, DateTime deadline)
  {
    child.addTask(name, reward, deadline);
  }
}