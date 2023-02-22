import 'package:flutter/material.dart';

class ParentPage extends StatefulWidget
{
  const ParentPage({Key? key}) : super(key: key);

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
        drawer: ,

      ),
    );
  }
}