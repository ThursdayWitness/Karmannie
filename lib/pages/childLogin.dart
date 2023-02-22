import 'package:flutter/material.dart';
import 'package:karmannie/pages/childPage.dart';

import '../widgets/popupWindow.dart';

class ChildLogin extends StatefulWidget {
  const ChildLogin({Key? key}) : super(key: key);

  @override
  State<ChildLogin> createState() => _ChildLoginState();
}

class _ChildLoginState extends State<ChildLogin> {
  final loginController = TextEditingController();

  @override
  void dispose()
  {
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Center(
          child: FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 0.5,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Text("Детям",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.none)),
                ),
                const Text("Karmaнные",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none)),
                Material(
                  child: TextField(
                    controller: loginController,
                    decoration: const InputDecoration(
                      labelText: "Твой код",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      showDialog(context: context, builder: (context) => const PopupWindow(messageText: "Lorem ipsum dolor sit amet and smth else I don't know and I don't care so leave me alone, please."));
                    },
                    child: const Align(
                        alignment: Alignment.bottomRight,
                        child: Text("Где взять код?"))),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size.fromWidth(200),
                        primary: Colors.black,
                        backgroundColor: Colors.amber),
                    onPressed: () {
                      if (codeIsRight(loginController.text)) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChildPage()));
                      }
                      else {
                          showDialog(context: context, builder: (context) => const PopupWindow(messageText: "There's no such code."));
                        }
                    },
                    child: const Text("Войти")),
              ],
            ),
          ),
        );
      }),
    );
  }

  bool codeIsRight(String text) {
    // check code in DB. Hardcoded for now
    return text == "test";
  }
}
