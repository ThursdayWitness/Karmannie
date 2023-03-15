import 'package:flutter/material.dart';
import 'package:karmannie/pages/childLogin.dart';
import 'package:karmannie/pages/parentLogin.dart';
import 'controllers/nav_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Karmaнные",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        backgroundColor: Colors.white70,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
            .copyWith(background: Colors.white),
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
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            const NavButton("Я ребёнок", ChildLogin()),
            const NavButton("Я родитель", ParentLogin()),
          ],
        ),
      ));
    });
  }
}
