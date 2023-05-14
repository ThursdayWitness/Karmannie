import 'dart:math';

import 'package:flutter/material.dart';
import 'package:karmannie/dbUtils.dart';
import 'package:karmannie/pages/taskPage.dart';
import 'package:karmannie/ui/input_field.dart';

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
                balance: child.balance.toString(),
                userProfilePic: Icons.account_circle_rounded),
          ElevatedButton(
              onPressed: () {
                addChildDialogBuilder(context);
              },
              child: const Text("Добавить ребёнка"))
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
                builder: (context) => ParentProfile(
                      parent: widget.parent,
                    ))),
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

Future<void> addChildDialogBuilder(
  BuildContext context,
) {
  final nameController = TextEditingController();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: Column(
          children: [
            const Text('Введите данные ребёнка'),
            InputBlock(
              label: "Имя ребёнка",
              controller: nameController,
            )
          ],
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () {
                // nameController.dispose();
                Navigator.of(context).pop();
              },
              child: const Text("Отменить")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Добавить',
            ),
            onPressed: () {
              generateCodeDialogBuilder(context, nameController.text)
                  .whenComplete(() {
                // nameController.dispose();
                Navigator.of(context).pop();
              });
            },
          )
        ],
      );
    },
  );
}

Future<void> generateCodeDialogBuilder(BuildContext context, String childName) {
  int code = Random().nextInt(899999) + 10000;
  addChild(childName, code.toString());
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: Text(code.toString()),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Готово"))
        ],
      );
    },
  );
}
