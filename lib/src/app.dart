import 'package:cooltime_action_button/src/controller/button_controller.dart';
import 'package:flutter/material.dart';

import 'components/cooltime_button.dart';
import 'components/display_view.dart';

ButtonController buttonController = ButtonController();

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

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
