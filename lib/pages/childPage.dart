import 'package:flutter/material.dart';
import 'package:karmannie/ui/progress_bar.dart';

import '../models/child.dart';
import '../models/goal.dart';
import '../ui/task_box.dart';
import '../ui/user_profile.dart';

class ChildProfile extends StatelessWidget {
  final Child child;

  const ChildProfile({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Профиль"),
        ),
        body: Column(
          children: [
            UserProfileCard(
                userName: child.name,
                balance: child.balance.toString(),
                userProfilePic: Icons.account_circle_rounded),
            ProgressIndicatorExample(
                child: child, goal: Goal(price: 1000, name: "Моя цель"))
          ],
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
          constraints: BoxConstraints.tight(const Size(100, 50)),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              border: const Border(),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 0.0),
              child: Column(
                children: const [
                  Icon(Icons.person_outline_outlined),
                  Text("Профиль"),
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChildProfile(child: widget.child)));
              })
          // child: BottomNavigationBar(
          //     elevation: 0,
          //     iconSize: 30,
          //     selectedItemColor: Theme.of(context).colorScheme.secondary,
          //     unselectedItemColor: Theme.of(context).colorScheme.secondary,
          //     backgroundColor: Theme.of(context).colorScheme.primary,
          //     onTap: (value) => Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => ChildProfile(child: widget.child))),
          //     items: const [
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.person_outline_rounded), label: "Профиль"),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.accessible_forward_rounded), label: "Костыль")
          //     ]),
          ),
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
