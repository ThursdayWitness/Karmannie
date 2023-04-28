import "package:flutter/material.dart";

class InputBlock extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;

  const InputBlock({Key? key, this.label, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
            child: Text(
              label!,
              style: const TextStyle(fontSize: 18, fontFamily: "Montserrat"),
            ),
          ),
        TextField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(16),
              constraints: BoxConstraints.loose(const Size(244, 44)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10)),
            )),
      ],
    );
  }
}
