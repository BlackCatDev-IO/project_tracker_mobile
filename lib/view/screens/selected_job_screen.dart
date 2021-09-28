import 'package:black_cat_lib/black_cat_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:hc_labor_tracker/utils/job_status_formatter.dart';
import 'package:hc_labor_tracker/view/widgets/buttons/job_action_button.dart';
import 'package:hc_labor_tracker/view/widgets/job_display_widgets/job_status_display_widget.dart';
import 'package:hc_labor_tracker/view/widgets/job_display_widgets/job_widget.dart';
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
              JobStatusDisplayWidget(statusDisplayModel),
              const SetupNotesTextfield(),
              const Spacer(),
              JobActionButton(model: JobStatusFormatter.buttonModel),
              const SizedBox(height: 50),
            ],
          ).paddingSymmetric(horizontal: 10);
        },
      ),
    );
  }
}
