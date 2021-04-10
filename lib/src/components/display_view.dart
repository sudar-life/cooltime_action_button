import 'package:cooltime_action_button/src/app.dart';
import 'package:cooltime_action_button/src/controller/button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DisplayView extends GetView<ButtonController> {
  DisplayView({Key key}) : super(key: key);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.actionButton.value) {
        case ButtonType.ACTION1:
          count++;
          break;
        case ButtonType.ACTION2:
          count--;
          break;
      }

      return Container(
        child: Text(
          count.toString(),
          style: TextStyle(fontSize: 100),
        ),
      );
    });
  }
}
