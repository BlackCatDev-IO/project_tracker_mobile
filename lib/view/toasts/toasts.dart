import 'package:black_cat_lib/toasts/my_toasts.dart';
import 'package:flutter/material.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';

class Toasts {
  static void setupHasBegun(BuildContext context) {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final startTime = JobController.to.jobSetupStartTime;

    final toastText =
        'Setup for $jobTitle has begun at ${startTime.format(context)}';

    MyToasts.showToast(toastContext: context, text: toastText);
  }

  static void setupCompleted(BuildContext context) {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final completedTime = JobController.to.jobSetupCompleteTime;

    final toastText =
        'Setup for $jobTitle has completed at ${completedTime.format(context)}';

    MyToasts.showToast(toastContext: context, text: toastText);
  }
}
