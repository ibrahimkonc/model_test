import 'package:flutter/material.dart';
import 'package:model_test/pages/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(context.watch<ProfileViewModel>().user!.avatar!),
            Text(context.watch<ProfileViewModel>().user!.firstName!),
            Text(context.watch<ProfileViewModel>().user!.lastName!),
            Text(context.watch<ProfileViewModel>().user!.email!)
          ],
        ),
      ),
    );
  }
}
