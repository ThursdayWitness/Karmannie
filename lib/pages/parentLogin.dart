import 'dart:ui';

import 'package:flutter/material.dart';

import 'parentTasks.dart';

class ParentLogin extends StatefulWidget {
  const ParentLogin({Key? key}) : super(key: key);

  @override
  State<ParentLogin> createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Align(
              alignment: Alignment.topRight,
              child: Text("Родителям",
                  style: TextStyle(color: Colors.amber, fontSize: 16))),
          Text("Karmaнные", style: Theme.of(context).textTheme.displayLarge),
          Material(
            child: TextField(
              controller: loginController,
              decoration: const InputDecoration(
                labelText: "Логин",
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          Material(
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Пароль",
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          Row(children: [
            TextButton(
                onPressed: () {},
                child: const Text("Зарегистрироваться",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.underline))),
            TextButton(
                onPressed: () {},
                child: const Text("Забыли пароль?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.underline)))
          ]),
          ElevatedButton(
            onPressed: () {
              if (codeIsRight(loginController.text, passwordController.text)) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ParentTasks()));
              }
            },
            child: const Text("Войти"),
          )
        ],
      ),
    );
  }
}

bool codeIsRight(String login, String password) {
  // check code in DB. Hardcoded for now
  return login == "test" && password == "test";
}
