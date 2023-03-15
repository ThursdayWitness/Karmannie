import 'package:flutter/material.dart';
import '../widgets/parentDrawer.dart';
import '../pseudo_database.dart';
import '../widgets/task_box.dart';

class ParentTasks extends StatefulWidget {
  const ParentTasks({Key? key}) : super(key: key);

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
      drawer: const ParentDrawer("Тестовый родитель"),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.topCenter,

        child: ListView(
          children: [
            for (var task in getParentTasks("Тестовый родитель"))
              TaskBox.parentSide(task),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
