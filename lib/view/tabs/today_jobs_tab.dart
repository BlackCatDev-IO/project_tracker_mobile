import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:hc_labor_tracker/view/widgets/job_widget.dart';

class TodayJobs extends StatelessWidget {
  const TodayJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobController>(
      init: JobController(),
      builder: (controller) => ListView.builder(
        itemCount: controller.jobList.length,
        itemBuilder: (context, index) =>
            JobWidget(model: controller.jobList[index], jobIndex: index),
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
