import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit/services/router.dart';
import 'package:starter_kit/widgets/screen_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Profile',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push(profileChangePasswordPath); // your named path
              },
              child: const Text('Go to change password'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(loginPath); // your named path
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
