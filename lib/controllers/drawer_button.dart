import 'package:flutter/material.dart';


class DrawerButton extends StatelessWidget
{
  final String name;
  final Icon icon;
  final Widget routeTarget;

  const DrawerButton(this.name, this.icon, this.routeTarget, {Key? key}): super(key: key);

  @override
  Widget build (BuildContext context)
  {
    return Row(
      children: [
        icon,
        TextButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => routeTarget));
          },
          child: Text(name, style: const TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}