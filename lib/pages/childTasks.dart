import 'package:flutter/material.dart';
import 'package:karmannie/widgets/ChildDrawer.dart';
import 'package:karmannie/widgets/ChildTaskWidget.dart';
import 'package:flutter/rendering.dart';

class ChildTasks extends StatelessWidget {
  const ChildTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Доска заданий",
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFFFCE4E8),
      ),
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.amber,
          title: const Text("Доска заданий"),
          centerTitle: true,
        ),
        drawer: const Drawer(child: ChildDrawer()),
        body: ListView(
          children: const [
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
      ),
    );
  }
}
