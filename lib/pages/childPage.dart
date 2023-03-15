import 'package:flutter/material.dart';
import '../models/child.dart';
import '../pseudo_database.dart';
import '../widgets/ChildDrawer.dart';

class ChildPage extends StatelessWidget {
  final Child child = getChild("Тестовый4");

  ChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Мой счёт"),
        ),
        drawer: const Drawer(
          child: ChildDrawer(),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_circle, size: 100),
                Column(
                  children: [
                    Text(child.getName, style: const TextStyle(fontSize: 24)),
                    SizedBox(
                      width: 160,
                      height: 24,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(
                                color: Colors.amber,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "${child.getMoney}руб.",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
