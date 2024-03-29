import 'package:flutter/material.dart';
import 'package:karmannie/custom_icons_icons.dart';

import '../dbUtils.dart';
import '../models/all.dart';
import '../pages/taskPage.dart';

class TaskBox extends StatelessWidget {
  Child? child;
  Parent? parent;
  final Task task;
  late bool isOnParentSide = false;
  final void Function(void Function())? callback;

  TaskBox.childrenSide({required this.task, this.callback, Key? key})
      : super(key: key);

  TaskBox.parentSide(
      {required this.task, this.parent, required this.child, this.callback, Key? key})
      : super(key: key) {
    isOnParentSide = true;
  }

  @override
  Widget build(BuildContext context) {
    const Color checkIconColor = Colors.amber;
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: task.isDone
                      ? Colors.green
                      : Theme.of(context).primaryColor,
                  width: 2.4))),
      constraints: BoxConstraints.tight(const Size.fromHeight(100)),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          // Заголовок бокса
          Container(
            height: 34,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color:
                    task.isDone ? Colors.green : Theme.of(context).primaryColor,
                // border: Border.all(color: Colors.amber),
                borderRadius: const BorderRadius.vertical(
                    top: Radius.elliptical(10, 10))),
            child: Row(
              children: [
                Text(
                    task.title.length > 22
                        ? task.title.substring(0, 22) + '...'
                        : task.title,
                    style: const TextStyle(fontSize: 20, fontFamily: "Inter")),
                Row(mainAxisSize: MainAxisSize.max, children: [
                  if (child != null) Text(child!.name),
                  const Icon(
                    Icons.account_circle_rounded,
                  ),
                  Text(
                    "\u20BD" + task.reward.toString(),
                    style: const TextStyle(fontFamily: "Inter", fontSize: 15),
                  )
                ])
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
            ),
          ),
          // Тело бокса
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TaskPage(
                          task: task,
                          parent: parent,
                          isReadOnly: true,
                        )));
              },
              child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (task.description != null)
                        Expanded(
                          flex: 4,
                          child: Text(
                            task.description!,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      const Spacer(),
                      if (isOnParentSide && task.isDone)
                        InkWell(
                          onTap: () {
                            {
                              reviewTaskDialogBuilder(context,
                                      task: task, child: child!)
                                  .then((value) => callback!(() => {}));
                            }
                          },
                          child: Stack(children: const [
                            Icon(Icons.circle, color: Colors.black, size: 40),
                            Icon(
                              CustomIcons.ok_circle,
                              color: checkIconColor,
                              size: 40,
                            ),
                          ]),
                        ),
                      if (!isOnParentSide && !task.isDone)
                        InkWell(
                          onTap: () {
                            {
                              completeTaskDialogBuilder(context, task: task)
                                  .then((value) => callback!(() => {}));
                            }
                          },
                          child: Stack(children: const [
                            Icon(Icons.circle, color: Colors.black, size: 40),
                            Icon(
                              CustomIcons.ok_circle,
                              color: checkIconColor,
                              size: 40,
                            ),
                          ]),
                        ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> completeTaskDialogBuilder(BuildContext context,
    {required Task task}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: Text('Хочешь отправить задание "${task.title}" на проверку?'),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Отменить")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Отправить',
            ),
            onPressed: () {
              completeTask(task);
              Navigator.of(context).pop();
              dialogBuilder(context,
                  task: task,
                  text:
                      'Задание ${task.title} успешно отправлено на проверку!');
            },
          )
        ],
      );
    },
  );
}

Future<void> reviewTaskDialogBuilder(BuildContext context,
    {required Task task, required Child child}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: Text('Хочешь подтвердить выполнение задания "${task.title}"?'),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Отменить")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Подтвердить',
            ),
            onPressed: () async {
              reviewTask(task);
              rewardChild(child, task.reward);
              Navigator.of(context).pop();
              dialogBuilder(context,
                  task: task,
                  text:
                      'Выполнение задания "${task.title}" успешно подтверждено!');
            },
          )
        ],
      );
    },
  );
}

Future<void> dialogBuilder(BuildContext context,
    {required Task task, required String text}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(text),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('К заданиям'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
