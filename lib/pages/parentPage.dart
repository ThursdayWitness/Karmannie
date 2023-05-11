import 'package:flutter/material.dart';
import 'package:karmannie/pages/taskPage.dart';

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
      body: ListView(
        children: [
          for (var entry in widget.parent.tasks.entries)
            if (!entry.value.isRewied)
              TaskBox.parentSide(
                task: entry.value,
                child: entry.key,
                callback: setState,
              )
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const TaskPage()));
        },
        child: const Icon(Icons.add, size: 44),
      ),
    );
  }
}
