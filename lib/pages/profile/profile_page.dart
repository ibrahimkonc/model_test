import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(user.avatar!),
          Text(user.firstName!),
          Text(user.lastName!),
          Text(user.email!)
        ],
      ),
    );
  }
}
