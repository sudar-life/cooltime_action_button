import 'package:cooltime_action_button/src/components/cooltime_button.dart';
import 'package:cooltime_action_button/src/controller/button_controller.dart';
import 'package:flutter/material.dart';

class ActionButtonZone extends StatelessWidget {
  const ActionButtonZone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CoolTimeButton(
            coolTime: 10,
            type: ButtonType.SKILL1,
            skillAnimationTime: 800,
            buttonName: "더하기",
            buttonSize: Size(70, 70),
          ),
          SizedBox(width: 10),
          CoolTimeButton(
            coolTime: 4,
            type: ButtonType.SKILL2,
            skillAnimationTime: 2800,
            buttonName: "빼기",
            buttonSize: Size(70, 70),
          ),
        ],
      ),
    );
  }
}
