import 'package:flutter/cupertino.dart';
import 'package:starter_kit/widgets/screen_container.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenContainer(
      title: 'Change Password',
      child: Text('Change Password'),
    );
  }
}
