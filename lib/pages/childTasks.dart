import 'package:flutter/material.dart';
import 'package:karmannie/widgets/ChildDrawer.dart';
import '../widgets/taskBox.dart';
import 'package:karmannie/pseudo_database.dart';

class ChildTasks extends StatelessWidget {
  // final child = getChild("Тестовый4");
  ChildTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Доска заданий"),
        ),
        drawer: const Drawer(child: ChildDrawer()),
        body: ListView(
          children: [
            for(var task in getChildTasks("Тестовый4")) TaskBox.childrenSide(task),
            //ChildTask(),
          ],
        ),
      );
  }
}
