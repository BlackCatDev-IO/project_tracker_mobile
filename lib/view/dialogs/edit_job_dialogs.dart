import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EditJobDialogs {
  static void confirmSuccessfulJobUpdate() {
    const content = '';
    const delete = '';
    const goBack = '';

    final dialog = Platform.isIOS
        ? CupertinoAlertDialog(
            content: Text(
              content,
              style: TextStyle(fontSize: 11.5.sp),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Get.back(),
                child: const Text(goBack),
              ),
            ],
          )
        : AlertDialog(
            content: const Text(content),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(delete),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(goBack),
              ),
            ],
          );

    Get.dialog(dialog, barrierDismissible: true);
  }
}
