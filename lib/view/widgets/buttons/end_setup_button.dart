import 'package:black_cat_lib/widgets/my_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';

class EndSetupButton extends GetView<JobController> {
  const EndSetupButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        onPressed: () => controller.endSetup(
            status: JobStatus.setupCompleted, toastContext: context),
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: const MyTextWidget(text: 'End Setup'),
      ),
    ).paddingOnly(top: 5);
  }
}
