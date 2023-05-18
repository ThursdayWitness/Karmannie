import 'package:flutter/material.dart';

import '../models/child.dart';
import '../models/goal.dart';

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample(
      {Key? key, required this.child, required this.goal})
      : super(key: key);

  final Child child;
  final Goal goal;

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      value: (widget.child.balance / widget.goal.price),

      /// [AnimationController]s can be created with vsync: this because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    // controller.
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child:
                  Text("Цель:\t${widget.goal.name} (${widget.goal.price}р)")),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: controller.value,
                minHeight: 20,
              ),
            ),
          ),
          controller.value < 1.0
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                      "Осталось заработать ${widget.goal.price - widget.child.balance} р!"))
              : Column(
                  children: [
                    const Text("Цель достигнута!"),
                    Text(
                        "Собрано ${widget.child.balance}/${widget.goal.price}р !")
                  ],
                )
        ],
      ),
    );
  }
}
