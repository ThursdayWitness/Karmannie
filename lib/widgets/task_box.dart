import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskBox extends StatelessWidget {
  final Task task;
  bool isOnParentSide = false;

  TaskBox.childrenSide(this.task, {Key? key}) : super(key: key);
  TaskBox.parentSide(this.task, {Key? key}) : super(key: key) {
    isOnParentSide = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      width: 20,
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Colors.amber),
                borderRadius: const BorderRadius.vertical(
                    top: Radius.elliptical(10, 20))),
            child: Row(
              children: [
                Text(task.name),
                Row(children: [
                  const Icon(Icons.person),
                  Text(task.reward.toString())
                ])
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(10, 20)),
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                              width: 200,
                              height: 80,
                              child: Text(task.description)),
                          Text(task.deadline.toString())
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
