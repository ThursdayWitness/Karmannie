import 'package:flutter/material.dart';
import '../controllers/drawer_button.dart';

class CustomDrawer extends StatelessWidget {
  final String accountName;
  final List<DrawerButton> children;

  const CustomDrawer(this.accountName, this.children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.account_circle, size: 66),
                Text(
                  accountName,
                  style: const TextStyle(fontSize: 24),
                ),
                for(var child in children) child,
              ],
            ),
          ),
          // for(var child in children) DrawerButton(child.item1, child.item2, child.item3),
        ],
      ),
    );
  }
}
