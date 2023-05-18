import 'package:flutter/material.dart';

import 'drawer_button.dart';

class CustomDrawer extends Drawer {
  final String accountName;
  final List<DrawerButton> children;

  const CustomDrawer(this.accountName, this.children, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(Icons.account_circle, size: 100),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    accountName,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
          for (var child in children) child
        ],
      ),
    );
  }
}
