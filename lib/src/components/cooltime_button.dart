import 'package:cooltime_action_button/src/components/progress_animate_container.dart';
import 'package:cooltime_action_button/src/controller/button_controller.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class CoolTimeButton extends StatefulWidget {
  CoolTimeButton({Key key}) : super(key: key);

  @override
  _CoolTimeButtonState createState() => _CoolTimeButtonState();
}

class _CoolTimeButtonState extends State<CoolTimeButton>
    with SingleTickerProviderStateMixin {
  bool isActive = true;
  int delay = 5;

  AnimationController animationController;
  Animation<double> animation;
  double _progress = 0;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: delay), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(parent: animationController, curve: Curves.linear),
    )..addListener(
        () {
          setState(
            () {
              _progress = animation.value;
              if (animationController.isCompleted) {
                _changeState(true);
              }
            },
          );
        },
      );
    super.initState();
  }

  void _changeState(bool state) {
    setState(() {
      isActive = state;
    });
  }

  void _actionButton() {
    if (isActive) {
      _changeState(false);
      animationController.forward(from: 0);
      buttonController.action(ButtonType.ACTION1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: _actionButton,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ProgressAnimateContainer(
              progress: _progress,
              width: 100,
              height: 100,
            )),
      ),
    );
  }
}
