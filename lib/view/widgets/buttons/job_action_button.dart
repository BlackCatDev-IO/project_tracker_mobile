import 'package:black_cat_lib/widgets/my_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:hc_labor_tracker/models/job_action_button_model.dart';

class JobActionButton extends GetView<JobController> {
  final JobActionButtonModel model;
  const JobActionButton({required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        onPressed: () =>
            controller.jobAction(status: model.status, toastContext: context),
        style: ElevatedButton.styleFrom(primary: model.color),
        child: MyTextWidget(text: model.buttonText),
      ),
    ).paddingOnly(top: 5);
  }
}
