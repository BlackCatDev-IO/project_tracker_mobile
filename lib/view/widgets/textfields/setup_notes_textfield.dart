import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';

class SetupNotesTextfield extends GetView<JobController> {
  const SetupNotesTextfield();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.textController,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
        hintText: 'Setup Notes',
      ),
    ).paddingOnly(top: 10);
  }
}
