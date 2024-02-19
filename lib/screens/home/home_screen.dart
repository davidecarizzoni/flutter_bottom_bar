import 'package:flutter/cupertino.dart';
import 'package:starter_kit/widgets/screen_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenContainer(
      title: 'Home',
      child: Text('Home screen'),
    );
  }
}
