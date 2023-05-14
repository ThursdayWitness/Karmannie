import 'package:flutter/material.dart';
import './pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Karmaнные",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.amber, accentColor: Colors.black)
            .copyWith(background: Colors.white),
        fontFamily: "Montserrat",
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: Colors.black,
              fontFamily: "Inter",
              fontSize: 44,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle:
              TextStyle(fontFamily: "Inter", fontSize: 20, color: Colors.black),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
      themeMode: ThemeMode.light,
      home: const StartPage(),
    );
  }
}
