import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/ChildDrawer.dart';

class ChildPage extends StatelessWidget {
  const ChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Мой счёт"),
          centerTitle: true,
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
                    const Text("Имя аккаунта", style: TextStyle(fontSize: 24)),
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
                          child: const Text(
                            "344 руб.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
