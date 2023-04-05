import "package:flutter/material.dart";

import "../ui/input_field.dart";
import "../ui/nav_button.dart";
import "../ui/popupWindow.dart";
import "childPage.dart";
import "parentPage.dart";

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Karmaнные", style: Theme.of(context).textTheme.displayLarge),
          NavButton(
              child: "Я родитель",
              action: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginParent()))), // LoginChild
          NavButton(
              child: "Я ребёнок",
              action: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginChild()))), // LoginParent
        ],
      ),
    ));
  }
}

class LoginParent extends StatelessWidget {
  LoginParent({Key? key}) : super(key: key);

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    // super.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                  alignment: Alignment.topRight,
                  child: Text("Родителям",
                      style: TextStyle(color: Colors.amber, fontSize: 16))),
              Text("Karmaнные",
                  style: Theme.of(context).textTheme.displayLarge),
              InputBlock(
                label: "Email",
                controller: loginController,
              ),
              InputBlock(
                label: "Пароль",
                controller: passwordController,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Зарегистрироваться",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.underline))),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(244, 44),
                    textStyle:
                        const TextStyle(fontFamily: "Inter", fontSize: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  // if (codeIsRight(
                  //     loginController.text, passwordController.text)) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ParentPage()));
                  // }
                },
                child: const Text("Войти"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginChild extends StatelessWidget {
  const LoginChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(66.6),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                  alignment: Alignment.topRight,
                  child: Text("Детям",
                      style: TextStyle(color: Colors.blue, fontSize: 16))),
              Text("Karmaнные",
                  style: Theme.of(context).textTheme.displayLarge),
              const InputBlock(label: "Твой код"),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const PopupWindow(
                              messageText:
                                  "Код могут отправить твои родители, посмотрев его у себя в приложении.",
                            ));
                  },
                  child: const Text("Где взять код?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.underline))),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(244, 44),
                    textStyle:
                        const TextStyle(fontFamily: "Inter", fontSize: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  // if (codeIsRight(
                  //     loginController.text, passwordController.text)) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChildTasks()));
                  // }
                },
                child: const Text("Войти"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
