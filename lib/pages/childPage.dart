import 'package:flutter/material.dart';
import '../models/child.dart';
import '../ui/task_box.dart';

class ChildProfile extends StatelessWidget {
  final Child child;
  const ChildProfile({required this.child, Key? key}) : super(key: key);

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
                        child: Text(child.name,
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
                            "${child.balance} руб.",
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
  const ChildTasks({Key? key, required this.child}) : super(key: key);

  final Child child;

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
            onTap: (value) => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChildProfile(child: widget.child))),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded), label: "Профиль"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.accessible_forward_rounded),
                  label: "Костыль")
            ]),
      ),
      /*body: FutureBuilder<List<Task>>(
        // future: getChildTasks("Маруся"),
        future: getTasks(),
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasError) {
            print("Shapshot error: ${snapshot.error}");
            return const Text("An error has occured. More info in the console.");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "Задач нет!",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              var data = snapshot.data!;
              return ListView(
                children: [
                  for (var task in data)
                    TaskBox.childrenSide(
                      task: task,
                      callback: setState,
                    )
                ],
              );
            }
          }
          return Center(
            child: Text(
              "Загрузка....",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
      ),*/
      body: ListView(
        children: [
          for (var task in widget.child.tasks)
            if (!task.isRewied)
              TaskBox.childrenSide(
                task: task,
                callback: setState,
              )
        ],
      ),
    );
  }
}
