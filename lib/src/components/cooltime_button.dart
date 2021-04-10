import 'package:cooltime_action_button/src/controller/button_controller.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class CoolTimeButton extends StatefulWidget {
  CoolTimeButton({Key key}) : super(key: key);

  @override
  _CoolTimeButtonState createState() => _CoolTimeButtonState();
}

class _CoolTimeButtonState extends State<CoolTimeButton> {
  bool isActive = true;
  @override
  void initState() {
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
      buttonController.action(ButtonType.ACTION1);
      Future.delayed(Duration(seconds: 1), () {
        _changeState(true);
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
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade400,
                  child: Center(
                    child: Text(
                      "BUTTON",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: isActive
                      ? Colors.transparent
                      : Colors.black.withOpacity(0.5),
                ),
              ],
            )),
      ),
    );
  }
}
