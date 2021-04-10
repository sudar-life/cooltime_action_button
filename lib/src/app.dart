import 'package:cooltime_action_button/src/controller/button_controller.dart';
import 'package:flutter/material.dart';

import 'components/cooltime_button.dart';
import 'components/display_view.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DisplayView(),
            CoolTimeButton(),
          ],
        ),
      ),
    );
  }
}
