import 'package:black_cat_lib/widgets/my_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';

class StartSetupButton extends GetView<JobController> {
  final BuildContext toastContext;
  const StartSetupButton(this.toastContext);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        onPressed: () => controller.startSetup(
            status: JobStatus.setupInProgress, toastContext: toastContext),
        child: const MyTextWidget(text: 'Start Setup'),
      ),
    ).paddingOnly(top: 5);
  }
}
