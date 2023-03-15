import 'package:flutter/material.dart';
import 'package:karmannie/main.dart';
import 'package:karmannie/pages/parentPage.dart';
import 'package:karmannie/pages/parentTasks.dart';
import 'package:karmannie/widgets/custom_drawer.dart';
import '../controllers/drawer_button.dart';

class ParentDrawer extends CustomDrawer {
  final String name;

  const ParentDrawer(this.name, {List<DrawerButton> buttons = const [
  DrawerButton("Задачи", Icon(Icons.fact_check), ParentTasks()),
  DrawerButton("Дети", Icon(Icons.groups), ParentPage()),
  DrawerButton("Выход", Icon(Icons.exit_to_app), MyApp()),
  ], Key? key}): super(name, buttons, key: key);
}
