import 'package:flutter/material.dart';

import '../dbUtils.dart';
import '../models/all.dart';
import '../ui/input_field.dart';

class TaskPage extends StatefulWidget {
  final Task? task;
  final bool isReadOnly;
  final Parent? parent;

  const TaskPage({this.task, this.parent, this.isReadOnly = false, Key? key})
      : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final controllerTitle = TextEditingController();
  final controllerDesc = TextEditingController();
  final controllerReward = TextEditingController();
  var dropDownButtonValues = List<String>.empty(growable: true);
  String dropDownButtonValue = "";

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerDesc.dispose();
    controllerReward.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.parent != null && mounted) {
      for (var child in widget.parent!.children) {
        dropDownButtonValues.add(child.name);
      }
      dropDownButtonValue = dropDownButtonValues[0];
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isReadOnly & (widget.task != null)) {
      controllerTitle.text = widget.task!.title;
      controllerDesc.text =
          widget.task!.description == null ? "" : widget.task!.description!;
      controllerReward.text = "${widget.task!.reward}\u20BD";
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Подробнее"),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Padding(padding: EdgeInsets.only(top: 16.0)),
        const SizedBox(
          width: 244,
          child: Text(
            "Исполнитель",
            style: TextStyle(fontSize: 18, fontFamily: "Montserrat"),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 244, minHeight: 44),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
                isExpanded: true,
                value: dropDownButtonValue,
                items: [
                  for (var value in dropDownButtonValues)
                    DropdownMenuItem(child: Text(value), value: value),
                ],
                dropdownColor: Theme.of(context).primaryColor,
                onChanged: widget.isReadOnly
                    ? null
                    : (value) {
                        setState(() {
                          dropDownButtonValue = value!;
                        });
                      }),
          ),
        ),

        InputBlock(
          label: "Название",
          isReadOnly: widget.isReadOnly,
          isEnabled: !widget.isReadOnly,
          controller: controllerTitle,
        ),
        InputBlock(
          label: "Описание",
          isReadOnly: widget.isReadOnly,
          isEnabled: !widget.isReadOnly,
          controller: controllerDesc,
          // inputType: TextInputType.multiline,
          minLines: 1,
          maxLines: 100,
        ),
        InputBlock(
          label: "Награда",
          isReadOnly: widget.isReadOnly,
          isEnabled: !widget.isReadOnly,
          controller: controllerReward,
          inputType: TextInputType.number,
        ),
        if (!widget.isReadOnly)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(244, 44),
                        textStyle:
                            const TextStyle(fontFamily: "Inter", fontSize: 24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      addTask({
                        "title": controllerTitle.text,
                        "description": controllerDesc.text,
                        "reward": controllerReward.text,
                        "isDone": false,
                        "isRewied": false,
                      }, dropDownButtonValue);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Добавить")),
                if (widget.isReadOnly &&
                    widget.task != null &&
                    !widget.task!.isDone)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          fixedSize: const Size(244, 44),
                          textStyle: const TextStyle(
                              fontFamily: "Inter", fontSize: 24),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        deleteTask(widget.task!);
                        Navigator.of(context).pop();
                      },
                      child: const Text("Удалить"))
              ],
            ),
          ),
      ]),
    );
  }
}
