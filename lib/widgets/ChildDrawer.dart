import 'package:flutter/material.dart';
import 'package:karmannie/pages/childPage.dart';
import 'package:karmannie/pages/childTasks.dart';

class ChildDrawer extends StatelessWidget {
  const ChildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle, size: 66),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChildPage()));},
                  child: const Text('Имя аккаунта', style: TextStyle(decoration: TextDecoration.underline, fontSize: 24),)),
            ],
          ),
        ),
        Row(
          children: [
            const Icon(Icons.fact_check),
            TextButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChildTasks()));
              },
              child: const Text("Задачи", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.settings),
            TextButton(
              onPressed: (){},
              child: const Text("Настройки", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.exit_to_app),
            TextButton(
              onPressed: (){},
              child: const Text("Выход", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),

      ],
    );
  }
}
