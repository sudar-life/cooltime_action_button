import 'package:cooltime_action_button/src/components/progress_animate_container.dart';
import 'package:cooltime_action_button/src/controller/button_controller.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class CoolTimeButton extends StatefulWidget {
  final ButtonType type;
  final int coolTime;
  final int skillAnimationTime;
  final String buttonName;
  final Size buttonSize;
  CoolTimeButton(
      {Key key,
      this.type,
      this.buttonName,
      this.buttonSize,
      this.coolTime,
      this.skillAnimationTime})
      : super(key: key);

  @override
  _CoolTimeButtonState createState() => _CoolTimeButtonState();
}

class _CoolTimeButtonState extends State<CoolTimeButton>
    with SingleTickerProviderStateMixin {
  bool isActive = true;

  AnimationController animationController;
  Animation<double> animation;
  double _progress = 0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(seconds: widget.coolTime), vsync: this);
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
      ButtonController.to.action(widget.type);
      Future.delayed(Duration(milliseconds: widget.skillAnimationTime), () {
        ButtonController.to.action(ButtonType.IDLE);
      });
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
            width: widget.buttonSize.width,
            height: widget.buttonSize.height,
            child: Container(
              color: Colors.grey.withOpacity(0.4),
              child: Center(
                child: Text(
                  widget.buttonName,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
