import 'package:flutter/material.dart';
import '../ui/task_box.dart';
import '../ui/user_profile.dart';
import '../pseudo_database.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  State<ParentPage> createState() => ParentProfile();
}

class ParentProfile extends State<ParentPage> {
  String title = "Дети";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(children: [
          for (var child in getParentChildren("Тестовый родитель"))
            UserProfileCard(
                userName: child.getName,
                userProfilePic: Icons.account_circle_rounded)
        ]));
  }
}

class ParentTasks extends State<ParentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Доска заданий"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            for (var task in getParentTasks("Тестовый родитель"))
              TaskBox.parentSide(task),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () {},
        child: const Icon(Icons.add, size: 44),
      ),
    );
  }
}
