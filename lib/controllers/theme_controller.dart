import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  ThemeData theme = ThemeData.dark();

  void updateTheme(ThemeData updatedTheme) {
    Get.changeTheme(updatedTheme);
    theme = updatedTheme;
    update();
  }
}
