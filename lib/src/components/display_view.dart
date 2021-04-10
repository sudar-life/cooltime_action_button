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
      Widget view = Container();
      switch (controller.actionButton.value) {
        case ButtonType.SKILL1:
          view = Container(
            width: 300,
            height: 300,
            child: Image.asset("assets/skill1.gif"),
          );
          break;
        case ButtonType.SKILL2:
          view = Container(
            width: 300,
            height: 300,
            child: Image.asset("assets/skill2.gif"),
          );
          break;
        case ButtonType.IDLE:
          view = Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/idle.gif"),
          );
          // TODO: Handle this case.
          break;
      }

      return Container(child: view);
    });
  }
}
