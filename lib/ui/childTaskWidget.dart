import 'package:flutter/material.dart';

//TODO: убрать кликабельность заголовка, добавить кнопку "Профиль".
class ChildTask extends StatelessWidget {
  const ChildTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Заголовок бокса задачи
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.amber),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.elliptical(10, 20))),
          child: SizedBox(
            height: 24,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Название задачи",
                  ),
                  Align(
                    child: Text("10 руб."),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Тело бокса задачи
        SizedBox(
          height: 76,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                child: Text("Описание...."),
                alignment: Alignment.topLeft,
              ),
              Align(
                child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 44,
                    )),
                alignment: Alignment.centerRight,
                widthFactor: 1,
                heightFactor: 1,
              )
            ],
          ),
        ),
      ],
    );
  }
}
