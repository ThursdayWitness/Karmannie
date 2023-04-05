import 'package:flutter/material.dart';
import 'package:karmannie/pages/childPage.dart';

import '../ui/input_field.dart';
import '../ui/popupWindow.dart';

class ChildLogin extends StatefulWidget {
  const ChildLogin({Key? key}) : super(key: key);

  @override
  State<ChildLogin> createState() => _ChildLoginState();
}

class _ChildLoginState extends State<ChildLogin> {
  final loginController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(66.6),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Text("Детям",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    )),
              ),
              Text("Karmaнные",
                  style: Theme.of(context).textTheme.displayLarge),
              const Padding(
                padding: EdgeInsets.all(16),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Твой код",
                    style: TextStyle(fontSize: 24),
                  )),
              InputBlock(controller: loginController),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const PopupWindow(
                            messageText:
                                "Lorem ipsum dolor sit amet and smth else I don't know and I don't care so leave me alone, please."));
                  },
                  child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Где взять код?",
                        style: TextStyle(color: Colors.grey),
                      ))),
              ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    if (codeIsRight(loginController.text)) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ChildPage()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => const PopupWindow(
                              messageText: "There's no such code."));
                    }
                  },
                  child: const Text(
                    "Войти",
                    style: TextStyle(fontSize: 24),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

bool codeIsRight(String text) {
  // check code in DB. Hardcoded for now
  return text == "test";
}
