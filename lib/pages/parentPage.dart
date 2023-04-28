import 'package:flutter/material.dart';

import '../models/all.dart';
import '../ui/task_box.dart';
import '../ui/user_profile.dart';

class ParentProfile extends StatelessWidget {
  const ParentProfile({Key? key, required this.parent}) : super(key: key);

  final Parent parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Дети"),
        ),
        body: ListView(children: [
          for (var child in parent.children)
            UserProfileCard(
                userName: child.name,
                userProfilePic: Icons.account_circle_rounded)
        ]));
  }
}

class ParentTasks extends StatefulWidget {
  const ParentTasks({Key? key, required this.parent}) : super(key: key);

  final Parent parent;

  @override
  State<ParentTasks> createState() => _ParentTasksState();
}

class _ParentTasksState extends State<ParentTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Доска заданий"),
      ),
      /*body: FutureBuilder<List<Task>>(
        // future: getChildTasks("Маруся"),
        future: getTasks(),
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "Все задачи выполнены!\nДобавьте новую!",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              var data = snapshot.data!;
              return ListView(
                children: [
                  for (var task in data)
                    TaskBox.parentSide(
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
          for (var task in widget.parent.tasks)
            TaskBox.parentSide(
              task: task,
              callback: setState,
            )
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () {},
        child: const Icon(Icons.add, size: 44),
      ),
    );
  }
}
