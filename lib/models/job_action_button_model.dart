import 'package:flutter/material.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';

class JobActionButtonModel {
  final String buttonText;
  final Color color;
  final JobStatus status;

  JobActionButtonModel(
      {required this.buttonText, required this.color, required this.status});
}
