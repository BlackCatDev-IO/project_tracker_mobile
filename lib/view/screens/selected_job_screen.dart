import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:black_cat_lib/black_cat_lib.dart';
import 'package:hc_labor_tracker/utils/job_status_formatter.dart';
import 'package:hc_labor_tracker/view/widgets/buttons/end_setup_button.dart';
import 'package:hc_labor_tracker/view/widgets/buttons/start_setup_button.dart';
import 'package:hc_labor_tracker/view/widgets/job_widget.dart';
import 'package:hc_labor_tracker/view/widgets/my_app_bar.dart';
import 'package:hc_labor_tracker/view/widgets/textfields/setup_notes_textfield.dart';

class SelectedJobScreen extends GetView<JobController> {
  static const id = '/selected_job_screen';
  const SelectedJobScreen();

  @override
  Widget build(BuildContext context) {
    final currentJob = controller.jobList[controller.selectedJobIndex];

    return Scaffold(
      appBar: const MyAppBar(
        isTabBar: false,
      ),
      body: GetBuilder<JobController>(
        builder: (_) {
          final statusDisplayModel =
              JobStatusFormatter.statusDisplay(status: currentJob.jobStatus);
          return Column(
            children: [
              sizedBox5High,
              JobWidget(model: currentJob),
              currentJob.jobStatus == JobStatus.setupInProgress
                  ? MyTextWidget(
                      text: statusDisplayModel.statusText,
                      color: Colors.green,
                      fontSize: 20)
                  : const SizedBox(),
              const SetupNotesTextfield(),
              const Spacer(),
              currentJob.jobStatus == JobStatus.setupInProgress
                  ? const EndSetupButton()
                  : const StartSetupButton(),
              const SizedBox(height: 50),
            ],
          ).paddingSymmetric(horizontal: 10);
        },
      ),
    );
  }
}
