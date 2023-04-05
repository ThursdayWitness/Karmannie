import 'package:flutter/material.dart';
import '../models/child.dart';
import '../pseudo_database.dart';
import '../ui/task_box.dart';

class ChildPage extends StatefulWidget {
  final Child child = getChild("Тестовый4");

  ChildPage({Key? key}) : super(key: key);

  @override
  State<ChildPage> createState() => ChildProfile();
}

class ChildProfile extends State<ChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Профиль"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 66.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 144),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Text(widget.child.getName,
                            style: const TextStyle(
                                fontSize: 24, fontFamily: "Inter")),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 4),
                          width: 160,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(
                                color: Colors.amber,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "${widget.child.getMoney} руб.",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: "Inter"),
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class ChildTasks extends StatefulWidget {
  const ChildTasks({Key? key}) : super(key: key);

  @override
  State<ChildTasks> createState() => _ChildTasksState();
}

class _ChildTasksState extends State<ChildTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Доска заданий"),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0),
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: const Border(),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: BottomNavigationBar(
            elevation: 0,
            iconSize: 30,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded), label: "Профиль"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.accessible_forward_rounded),
                  label: "Костыль")
            ]),
      ),
      body: ListView(
        children: [
          for (var task in getChildTasks("Тестовый4"))
            TaskBox.childrenSide(task),
          //ChildTask(),
        ],
      ),
    );
  }
}
