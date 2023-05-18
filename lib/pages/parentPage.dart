import 'dart:math';

import 'package:flutter/material.dart';
import 'package:karmannie/dbUtils.dart';
import 'package:karmannie/pages/taskPage.dart';
import 'package:karmannie/ui/input_field.dart';

import '../models/all.dart';
import '../ui/task_box.dart';
import '../ui/user_profile.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key, required this.parent}) : super(key: key);

  final Parent parent;

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  Parent? parent;

  @override
  void initState() {
    parent = widget.parent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Дети"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (var child in parent!.children)
                        UserProfileCard(
                            userName: child.name,
                            balance: child.balance.toString(),
                            userProfilePic: Icons.account_circle_rounded),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(244, 44),
                      textStyle:
                          const TextStyle(fontFamily: "Inter", fontSize: 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    addChildDialogBuilder(context, widget.parent.name);
                  },
                  child: const Text("Добавить ребёнка")),
            ),
          ],
        ));
  }
}

class ParentTasks extends StatefulWidget {
  const ParentTasks({Key? key, required this.parent}) : super(key: key);
  final Parent parent;

  @override
  State<ParentTasks> createState() => _ParentTasksState();
}

class _ParentTasksState extends State<ParentTasks> {
  Parent? parent;

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
            onTap: (value) {
              if (value == 0) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParentProfile(
                          parent: parent!,
                        )));
              } else if (value == 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TaskPage(parent: parent,)));
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded), label: "Профиль"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline),
                  label: "Добавить задачу")
            ]),
      ),
      body: FutureBuilder(
          future: getParent("Батя"),
          builder: (context, AsyncSnapshot<Parent> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              parent = snapshot.data;
              return ListView(
                children: [
                  for (var entry in parent!.tasks.entries)
                    for (var task in entry.value)
                      if (!task.isRewied)
                        TaskBox.parentSide(
                          task: task,
                          child: entry.key,
                          parent: parent,
                          callback: setState,
                        )
                ],
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else {
              return const Text('Unexpected error!');
            }
          }),
    );
  }
}

Future<void> addChildDialogBuilder(BuildContext context, String parentName) {
  final nameController = TextEditingController();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: const Text('Введите данные ребёнка'),
        content: Container(
          constraints: const BoxConstraints(maxHeight: 100),
          child: InputBlock(
            inputType: TextInputType.name,
            label: "Имя ребёнка",
            controller: nameController,
          ),
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
              generateCodeDialogBuilder(
                      context, nameController.text, parentName)
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

Future<void> generateCodeDialogBuilder(
    BuildContext context, String childName, String parentName) {
  int code = Random().nextInt(899999) + 100000;
  addChild(childName, code.toString(), parentName);
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: Text("Аккаунт ребёнка создан!\nСообщите ему этот код для входа:\n${code.toString()}"),
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
