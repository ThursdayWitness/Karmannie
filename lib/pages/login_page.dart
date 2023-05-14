import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

import "../dbUtils.dart";
import "../firebase_options.dart";
import "../ui/input_field.dart";
import "../ui/nav_button.dart";
import "../ui/popupWindow.dart";
import "./childPage.dart";
import "./parentPage.dart";

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Karmaнные",
                          style: Theme.of(context).textTheme.displayLarge),
                      NavButton(
                          child: "Я родитель",
                          action: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginParent()));
                            // getParent("Батя").then((parent) =>
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) =>
                            //             ParentTasks(parent: parent))));
                          }),
                      NavButton(
                          child: "Я ребёнок",
                          action: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => LoginChild()))),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

class LoginParent extends StatelessWidget {
  LoginParent({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(66.6),
          child: Form(
            key: _formKey,
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
                  controller: emailController,
                ),
                InputBlock(
                  label: "Пароль",
                  controller: passwordController,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterParent()));
                    },
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
                  onPressed: () async {
                    var parent = await getParent("Батя");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ParentTasks(parent: parent)));
                  },
                  child: const Text("Войти"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterParent extends StatelessWidget {
  RegisterParent({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(66.6),
          child: Form(
            key: _formKey,
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
                  label: "Имя",
                  controller: nameController,
                ),
                InputBlock(
                  label: "Email",
                  controller: emailController,
                ),
                InputBlock(
                  label: "Пароль",
                  controller: passwordController,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(244, 44),
                      textStyle:
                          const TextStyle(fontFamily: "Inter", fontSize: 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    registerUser(emailController.text, passwordController.text,
                        nameController.text).whenComplete(() => Navigator.of(context).pop());
                  },
                  child: const Text("Зарегистрироваться"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginChild extends StatelessWidget {
  LoginChild({Key? key}) : super(key: key);

  final codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
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
                  child: Text("Детям",
                      style: TextStyle(color: Colors.blue, fontSize: 16))),
              Text("Karmaнные",
                  style: Theme.of(context).textTheme.displayLarge),
              InputBlock(label: "Твой код", controller: codeController),
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
                onPressed: () async {
                  var child = await getChildByCode(codeController.text);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChildTasks(child: child)));
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

Future<String?> loginUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  return null;
}

Future<String?> registerUser(String email, String password, String name) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user!.updateDisplayName(name));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return null;
}

void listenToLogin() {
  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

Future<String?> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return null;
  } on FirebaseAuthException catch (ex) {
    return "${ex.code}: ${ex.message}";
  }
}
