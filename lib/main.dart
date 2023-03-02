import 'package:flutter/material.dart';
import 'package:karmannie/pages/childLogin.dart';
import 'package:karmannie/pages/parentLogin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Karmaнные",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
            .copyWith(background: Colors.white),
        // buttonTheme: ,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: Colors.black,
              fontSize: 44,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
        ),
        appBarTheme: const AppBarTheme(
          // shape: ShapeBorder(),
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String _title = 'Start page';

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Center(
          child: FractionallySizedBox(
        heightFactor: 0.3,
        widthFactor: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Karmaнные", style: Theme.of(context).textTheme.displayLarge),
            ElevatedButton(
              //TODO: выделить в отдельный класс
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
    });
  }
}
