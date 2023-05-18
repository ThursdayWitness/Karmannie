import 'package:flutter/material.dart';

import 'nav_button.dart';

class PopupWindow extends StatelessWidget {
  final String messageText;

  const PopupWindow({Key? key, required this.messageText}) : super(key: key);

  const PopupWindow.dialog({Key? key, required this.messageText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 216, 16, 216),
      padding: const EdgeInsets.fromLTRB(44, 44, 44, 16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(messageText,
                style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none)),
          ),
          NavButton(
            child: "Понятно!",
            action: () => Navigator.of(context).pop(context),
          )
        ],
      ),
    );
  }
}
