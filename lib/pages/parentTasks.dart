import 'package:flutter/material.dart';
import 'package:karmannie/widgets/parentTaskWidget.dart';
import '../widgets/parentDrawer.dart';

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
      drawer: const Drawer(child: ParentDrawer(),),
      body: ListView(
        children: [
          //TODO: change to function():List => DB request
          //TODO: several constructors for ParentTask
          ParentTask(isCompleted: true),
          ParentTask(isCompleted: false),
          ParentTask(isCompleted: false),
          ParentTask(isCompleted: true),
          ParentTask(isCompleted: false),
          ParentTask(isCompleted: false),
          ParentTask(isCompleted: true),
          ParentTask(isCompleted: true),
          ParentTask(isCompleted: true),
        ],
      ),
      floatingActionButton: ElevatedButton(onPressed: (){}, child: const Icon(Icons.add),),
    );
  }
}
