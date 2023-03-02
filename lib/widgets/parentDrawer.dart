import 'package:flutter/material.dart';
import 'package:karmannie/pages/parentPage.dart';
import 'package:karmannie/pages/parentTasks.dart';

class ParentDrawer extends StatelessWidget {
  const ParentDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.account_circle, size: 66),
              Text(
                'Имя аккаунта',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
        Row(children: [
          const Icon(Icons.fact_check),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ParentTasks()));
            },
            child: const Text("Задачи", style: TextStyle(color: Colors.black)),
          )
        ]),
        Row(
          children: [
            const Icon(Icons.groups),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ParentPage()));
              },
              child: const Text("Дети", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.settings),
            TextButton(
              onPressed: () {},
              child: const Text("Настройки",
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.exit_to_app),
            TextButton(
              onPressed: () {},
              child: const Text("Выход", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ],
    );
  }
}
