import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';

class MyToast {
  static FToast fToast = FToast();

  static _showToast({required String text}) {
    fToast.showToast(
      child: ToastWidget(toastText: text),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  static void setupHasBegun(BuildContext context) {
    _initToast(context);
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final startTime = JobController.to.jobSetupStartTime;
    _showToast(
        text: 'Setup for $jobTitle has begun at ${startTime.format(context)}');
    // Fluttertoast.showToast(
    //   msg: 'Setup for $jobTitle has begun at ${startTime.format(Get.context!)}',
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.TOP,
    //   backgroundColor: Colors.white,
    //   textColor: Colors.black,
    // );
  }

  static void _initToast(BuildContext context) {
    fToast = FToast();
    fToast.init(context);
  }

  static void setupCompleted() {
    final jobTitle =
        JobController.to.jobList[JobController.to.selectedJobIndex].jobTitle;
    final completedTime = JobController.to.jobSetupCompleteTime;
    Fluttertoast.showToast(
      msg:
          'Setup for $jobTitle has completed at ${completedTime.format(Get.context!)}',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
  }
}

class ToastWidget extends StatelessWidget {
  const ToastWidget({required this.toastText});

  final String toastText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(toastText),
        ],
      ),
    );
  }
}
