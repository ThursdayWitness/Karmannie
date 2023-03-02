import 'package:flutter/material.dart';
import '../widgets/ParentDrawer.dart';
import '../widgets/parentChildWidget.dart';

class ParentPage extends StatelessWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Мои дети"),
        ),
        drawer: const Drawer(
          child: ParentDrawer(),
        ),
        body: ListView(children: const [
          ChildWidget("Лошок"),
          ChildWidget("Крутой чел"),
          ChildWidget("Ну сойдёт"),
          ChildWidget("О привет Максим"),
        ]));
  }
}
