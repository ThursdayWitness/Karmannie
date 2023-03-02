import 'package:flutter/material.dart';
import 'package:karmannie/widgets/ChildDrawer.dart';
import 'package:karmannie/widgets/ChildTaskWidget.dart';

class ChildTasks extends StatelessWidget {
  const ChildTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Доска заданий"),
        ),
        drawer: const Drawer(child: ChildDrawer()),
        body: ListView(
          children: const [
            //TODO: контроллер-функция, формирующая список виджетов из запроса к БД
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
            ChildTask(),
          ],
        ),
      );
  }
}
