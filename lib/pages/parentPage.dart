import 'package:flutter/material.dart';
import '../widgets/parentChildWidget.dart';
import 'package:karmannie/pseudo_database.dart';

import '../widgets/parentDrawer.dart';

class ParentPage extends StatelessWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Мои дети"),
        ),
        drawer: const ParentDrawer("Тестовый родитель"),
        body: ListView(children: [
          for (var child in getParentChildren("Тестовый родитель")) ChildWidget(child.getName)
        ]));
  }
}
