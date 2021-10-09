import 'package:black_cat_lib/toasts/my_toasts.dart';
import 'package:flutter/material.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';

class Toasts {
  static void setupHasBegun(BuildContext context) {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final startTime = JobController.to.jobActionTime;

    final toastText =
        'Setup for $jobTitle has begun at ${startTime.format(context)}';

    MyToasts.showToast(
      toastContext: context,
      text: toastText,
      bottomOffset: 150,
      isTop: false,
    );
  }

  static void setupComplete(BuildContext context) {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final completedTime = JobController.to.jobActionTime;

    final toastText =
        'Setup for $jobTitle has completed at ${completedTime.format(context)}';

    MyToasts.showToast(
      toastContext: context,
      text: toastText,
      bottomOffset: 150,
      isTop: false,
    );
  }

  static void strikeInProgress(BuildContext context) {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final strikeStartTime = JobController.to.jobActionTime;

    final toastText =
        'Strike for $jobTitle has begun at ${strikeStartTime.format(context)}';

    MyToasts.showToast(
      toastContext: context,
      text: toastText,
      bottomOffset: 150,
      isTop: false,
    );
  }
 
  static void strikeComplete(BuildContext context) {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final jobCompletedTime = JobController.to.jobActionTime;

    final toastText =
        'Strike for $jobTitle has completed at ${jobCompletedTime.format(context)}';

    MyToasts.showToast(
      toastContext: context,
      text: toastText,
      bottomOffset: 150,
      isTop: false,
    );
  }
}
