import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Splash Screen'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Splash Screen',
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  "register",
                ); // your named path
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
