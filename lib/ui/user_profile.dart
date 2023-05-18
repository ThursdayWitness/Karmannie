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
    return Container(
      padding: const EdgeInsets.only(left: 44.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 44.0),
            child: Icon(userProfilePic, size: 100),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 100),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: const TextStyle(fontSize: 24)),
                  if (balance != null) Text("Баланс: ${balance!}р."),
                  if (code != null) Text("Код: ${code!}"),
                ]),
          ),
        ],
      ),
    );
  }
}
