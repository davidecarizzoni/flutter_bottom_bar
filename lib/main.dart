import 'package:flutter/material.dart';
import 'package:starter_kit/widgets/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      darkTheme: ThemeData.dark(),
    );
  }
}
