import 'package:flutter/material.dart';

class ChildWidget extends StatelessWidget {
  final String childName;

  const ChildWidget(this.childName, {Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 100),
            Text(childName, style: const TextStyle(fontSize: 24)),
          ],
        )
      ],
    );
  }
}
