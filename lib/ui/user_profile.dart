import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String userName;
  final IconData userProfilePic;
  const UserProfileCard(
      {required this.userName, required this.userProfilePic, Key? key})
      : super(key: key);

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(userProfilePic, size: 100),
            Text(userName, style: const TextStyle(fontSize: 24)),
          ],
        )
      ],
    );
  }
}
