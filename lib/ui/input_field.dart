import "package:flutter/material.dart";

class InputBlock extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? isReadOnly;
  final bool? isEnabled;
  final int? minLines;
  final int? maxLines;

  const InputBlock(
      {Key? key,
      this.isReadOnly,
      this.isEnabled,
      this.label,
      this.controller,
      this.inputType,
      this.minLines,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
            child: Text(
              "$label:",
              style: const TextStyle(fontSize: 18, fontFamily: "Montserrat"),
            ),
          ),
        TextFormField(
            readOnly: isReadOnly == null ? false : isReadOnly!,
            enabled: isEnabled,
            keyboardType: inputType,
            controller: controller,
            maxLines: maxLines,
            minLines: minLines,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(16),
              constraints: BoxConstraints.loose(const Size(244, 50)),
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
