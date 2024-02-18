import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit/widgets/screen_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Login',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  "register",
                ); // your named path
              },
              child: const Text('Go to Register'),
            ),
          ],
        ),
      ),
    );
  }
}
