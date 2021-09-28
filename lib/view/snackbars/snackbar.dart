import 'package:black_cat_lib/widgets/my_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:sizer/sizer.dart';

class Snackbars {
  static void setupHasBegun() {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final startTime = JobController.to.jobSetupStartTime;
    final snackBar = GetBar(
      messageText: MyTextWidget(
          text:
              'Setup for $jobTitle has begun at ${startTime.format(Get.context!)}',
          fontFamily: 'Roboto',
          color: Colors.black,
          fontSize: 12.sp,
          fontWeight: FontWeight.w200),
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
    Get.showSnackbar(snackBar);
  }

  static void setupHasCompleted() {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final completedTime = JobController.to.jobSetupCompleteTime;
    final snackBar = GetBar(
      messageText: MyTextWidget(
          text:
              'Setup for $jobTitle has completed at ${completedTime.format(Get.context!)}',
          fontFamily: 'Roboto',
          color: Colors.black,
          fontSize: 12.sp,
          fontWeight: FontWeight.w200),
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 3),
    );
    Get.showSnackbar(snackBar);
  }
}
