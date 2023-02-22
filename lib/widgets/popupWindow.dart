import 'package:flutter/material.dart';

class PopupWindow extends StatelessWidget {
  final String messageText;

  const PopupWindow({Key? key, required this.messageText }) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return Material(
      color: Colors.white70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(messageText),
          ElevatedButton(
            style: TextButton.styleFrom(
                fixedSize: const Size.fromWidth(200),
                primary: Colors.black,
                backgroundColor: Colors.amber),
            onPressed: () {
              Navigator.of(context).pop(context);
          },
            child: const Text("Понятно!"),
          ),
        ],
      ),
    );
  }
}
