import 'task.dart';

class Child {
  late final String id;
  late final String name;
  late final int balance;
  late List<Task> tasks = List<Task>.empty(growable: true);

  Child(Map<String, dynamic> dbChild) {
    id = dbChild["id"];
    name = dbChild["name"];
    balance = dbChild["balance"];
    tasks = dbChild["task"];
  }

  @override
  String toString() {
    return "Name: $name Balance: $balance";
  }
}
