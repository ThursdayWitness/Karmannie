import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String child;
  final void Function() action;

  const NavButton({required this.child, required this.action, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(200),
        foregroundColor: Colors.black,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onPressed: action,
      child: Text(child,
          style: const TextStyle(fontFamily: "Inter", fontSize: 20)),
    );
  }
}
