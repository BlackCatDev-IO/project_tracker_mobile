import 'package:flutter/material.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:hc_labor_tracker/models/job_action_button_model.dart';
import 'package:hc_labor_tracker/models/job_status_display_model.dart';

class JobStatusFormatter {
  static JobActionButtonModel buttonModel = JobActionButtonModel(
    buttonText: 'Start Setup',
    status: JobStatus.setupNotYetBegun,
    color: Colors.blue,
  );

  static JobStatusDisplayModel statusDisplay({required JobStatus status}) {
    /// button model displays the next action in sequence and displayModel
    /// shows current status
    switch (status) {
      case JobStatus.setupNotYetBegun:
        buttonModel = JobActionButtonModel(
          buttonText: 'Start Setup',
          status: JobStatus.setupInProgress,
          color: Colors.blue,
        );

        return JobStatusDisplayModel(
          statusText: 'Setup not yet begun',
          statusColor: Colors.red,
        );

      case JobStatus.setupInProgress:
        buttonModel = JobActionButtonModel(
          buttonText: 'Complete Setup',
          status: JobStatus.setupComplete,
          color: Colors.red,
        );
        return JobStatusDisplayModel(
          statusText: 'Setup in progress',
          statusColor: Colors.amber,
        );

      case JobStatus.setupComplete:
        buttonModel = JobActionButtonModel(
          buttonText: 'Begin Strike',
          status: JobStatus.strikeInProgress,
          color: Colors.blue,
        );

        return JobStatusDisplayModel(
          statusText: 'Setup Completed. Awaiting strike',
          statusColor: Colors.amber,
        );

      case JobStatus.strikeInProgress:
        buttonModel = JobActionButtonModel(
          buttonText: 'Complete Strike',
          status: JobStatus.strikeComplete,
          color: Colors.red,
        );

        return JobStatusDisplayModel(
          statusText: 'Strike in Progress',
          statusColor: Colors.amber,
        );

      case JobStatus.strikeComplete:
        buttonModel = JobActionButtonModel(
          buttonText: 'Edit Job Details',
          status: JobStatus.setupNotYetBegun,
          color: Colors.blue,
        );
        return JobStatusDisplayModel(
          statusText: 'Job Complete',
          statusColor: Colors.green,
        );
    }
  }
}
