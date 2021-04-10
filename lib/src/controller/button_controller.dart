import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ButtonController extends GetxController {
  static ButtonController get to => Get.find();
  Rx<ButtonType> actionButton = ButtonType.ACTION1.obs;

  action(ButtonType type) {
    actionButton(type);
  }
}

enum ButtonType { ACTION1, ACTION2 }
