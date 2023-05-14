import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String userName;
  final IconData userProfilePic;
  final String? code;
  final String? balance;
  const UserProfileCard(
      {required this.userName,
      required this.userProfilePic,
      this.code,
      this.balance,
      Key? key})
      : super(key: key);

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(userProfilePic, size: 100),
            Column(children: [
              Text(userName, style: const TextStyle(fontSize: 24)),
              if (balance != null) Text("Баланс: ${balance!}"),
              if (code != null) Text("Код: ${code!}"),
            ]),
          ],
        )
      ],
    );
  }
}
