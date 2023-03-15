import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String buttonText;
  final Widget route;

  const NavButton(this.buttonText, this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(200),
            foregroundColor: Colors.black,
            backgroundColor: Theme.of(context).primaryColor),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => route));
        },
        child: Text(buttonText));
  }
}
