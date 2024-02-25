import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit/services/router.dart';
import 'package:starter_kit/widgets/screen_container.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Register Screen',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(homePath); // your named path
              },
              child: const Text('Go to Homeeee'),
            ),
          ],
        ),
      ),
    );
  }
}
