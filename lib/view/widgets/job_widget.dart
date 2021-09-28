import 'package:black_cat_lib/widgets/my_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:hc_labor_tracker/models/job_model.dart';
import 'package:hc_labor_tracker/utils/date_time_formatter.dart';
import 'package:hc_labor_tracker/utils/job_status_formatter.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:black_cat_lib/black_cat_lib.dart';

class JobWidget extends GetView<JobController> {
  final JobModel model;
  final int? jobIndex;
  const JobWidget({required this.model, this.jobIndex});

  @override
  Widget build(BuildContext context) {
    final setupTime = DateTimeFormatter.formateFullDate12hr(model.setupTime);
    final startTime = DateTimeFormatter.formateFullDate12hr(model.eventStart);
    final endTime = DateTimeFormatter.formateFullDate12hr(model.eventEnd);
    final jobStatusDisplayModel =
        JobStatusFormatter.statusDisplay(status: model.jobStatus);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () =>
          jobIndex != null ? controller.selectJob(index: jobIndex!) : null,
      child: GetBuilder<JobController>(
        id: model.jobCode,
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              _JobTitleWidget(
                title: model.jobTitle,
              ),
              const SizedBox(height: 10),
              _JobParamWidget(
                description: 'Job Code',
                value: model.jobCode,
              ),
              sizedBox5High,
              _JobParamWidget(
                description: 'Room',
                value: model.eventLocation,
              ),
              sizedBox5High,
              _JobParamWidget(
                description: 'Setup Time',
                value: setupTime,
              ),
              sizedBox5High,
              _JobParamWidget(
                description: 'Event Start',
                value: startTime,
              ),
              sizedBox5High,
              _JobParamWidget(
                description: 'Event End',
                value: endTime,
              ),
              sizedBox5High,
              _JobParamWidget(
                  description: 'Status',
                  value: jobStatusDisplayModel.statusText,
                  statusColor: jobStatusDisplayModel.statusColor),
              const Divider(color: Colors.white).paddingOnly(top: 10),
            ],
          );
        },
      ),
    );
  }
}

class _JobTitleWidget extends StatelessWidget {
  final String title;
  const _JobTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return MyTextWidget(
      text: title,
      // color: Colors.greenAccent[400],
      color: Colors.teal[200],
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
    );
  }
}

class _JobParamWidget extends StatelessWidget {
  final String description, value;
  final Color? statusColor;
  const _JobParamWidget({
    required this.description,
    required this.value,
    this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyTextWidget(
            text: '$description: ',
            color: Colors.blue,
            fontWeight: FontWeight.w500),
        MyTextWidget(text: value, color: statusColor ?? Colors.white),
      ],
    );
  }
}
