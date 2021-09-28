import 'package:flutter/material.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:hc_labor_tracker/models/job_status_display_model.dart';

class JobStatusFormatter {
  static JobStatusDisplayModel statusDisplay({required JobStatus status}) {
    switch (status) {
      case JobStatus.setupCompleted:
        return JobStatusDisplayModel(
            statusText: 'Setup Completed', statusColor: Colors.green);

      case JobStatus.setupNotYetBegun:
        return JobStatusDisplayModel(
            statusText: 'Setup not yet begun', statusColor: Colors.red);

      case JobStatus.setupInProgress:
        return JobStatusDisplayModel(
            statusText: 'Setup in progress', statusColor: Colors.teal);

      case JobStatus.strikeInProgress:
        return JobStatusDisplayModel(
            statusText: 'Strike in Progress', statusColor: Colors.teal);

      case JobStatus.strikeCompleted:
        return JobStatusDisplayModel(
            statusText: 'Job Complete', statusColor: Colors.green);
    }
  }
}

