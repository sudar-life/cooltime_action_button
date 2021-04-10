import 'package:cooltime_action_button/src/app.dart';
import 'package:flutter/material.dart';

class DisplayView extends StatelessWidget {
  DisplayView({Key key}) : super(key: key);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: buttonController.actionButtonStream,
      builder: (_, snapshot) {
        count++;
        return Container(
          child: Text(
            count.toString(),
            style: TextStyle(fontSize: 100),
          ),
        );
      },
    );
  }
}
