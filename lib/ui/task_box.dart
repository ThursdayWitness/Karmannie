import 'package:flutter/material.dart';
import 'package:karmannie/custom_icons_icons.dart';
import '../models/task.dart';

class TaskBox extends StatelessWidget {
  final Task task;
  late bool isOnParentSide = false;

  TaskBox.childrenSide(this.task, {Key? key}) : super(key: key);
  TaskBox.parentSide(this.task, {Key? key}) : super(key: key) {
    isOnParentSide = true;
  }

  @override
  Widget build(BuildContext context) {
    final Color checkIconColor = task.isCompleted
        ? const Color.fromRGBO(200, 200, 200, 1.0)
        : Colors.amber;
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).primaryColor, width: 2.4))),
      constraints: BoxConstraints.tight(const Size.fromHeight(100)),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          // Заголовок бокса
          Container(
            height: 34,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Colors.amber),
                borderRadius: const BorderRadius.vertical(
                    top: Radius.elliptical(10, 10))),
            child: Row(
              children: [
                Text(task.name,
                    style: const TextStyle(fontSize: 20, fontFamily: "Inter")),
                Row(mainAxisSize: MainAxisSize.max, children: [
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
                    Expanded(
                      flex: 4,
                      child: Text(
                        task.description,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Stack(children: [
                        const Icon(Icons.circle, color: Colors.black, size: 40),
                        Icon(
                          CustomIcons.ok_circle,
                          color: checkIconColor,
                          size: 40,
                        ),
                      ]),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
