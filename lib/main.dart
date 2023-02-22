import 'package:flutter/material.dart';
import 'package:karmannie/pages/childLogin.dart';
import 'package:flutter/rendering.dart';
import 'package:karmannie/pages/parentLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Start page';

  @override
  Widget build(BuildContext context) {
        debugPaintSizeEnabled = false;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          scaffoldBackgroundColor: const Color(0xFFCDD5FF),
        ),
        home: Builder(builder: (context) {
          return Center(
              child: FractionallySizedBox(
            heightFactor: 0.3,
            widthFactor: 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Karmaнные",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none)),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size.fromWidth(200),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.amber),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ParentLogin()));
                    },
                    child: const Text("Я родитель")),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size.fromWidth(200),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.amber),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChildLogin()));
                    },
                    child: const Text("Я ребёнок"))
              ],
            ),
          ));
        }));
  }
}
