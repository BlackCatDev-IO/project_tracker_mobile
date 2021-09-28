import 'package:hc_labor_tracker/controllers/job_controller.dart';

class JobModel {
  String jobCode;
  String jobTitle;
  String eventLocation;
  String? description;
  DateTime setupTime, eventStart, eventEnd;
  JobStatus jobStatus;

  JobModel({
    required this.jobCode,
    required this.jobTitle,
    required this.eventLocation,
    required this.setupTime,
    required this.eventStart,
    required this.eventEnd,
    this.jobStatus = JobStatus.setupNotYetBegun,
    this.description,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    final jobCode = json['jobCode'] as String;
    final jobTitle = json['jobTitle'] as String;
    final eventLocation = json['eventLocation'] as String;
    final description = json['description'] as String;
    final setupTime = DateTime.parse(json['setupTime'] as String);
    final eventStart = DateTime.parse(json['eventStart'] as String);
    final eventEnd = DateTime.parse(json['eventEnd'] as String);
    final status = parseStatus(json['status'] as String);

    return JobModel(
      jobCode: jobCode,
      jobTitle: jobTitle,
      eventLocation: eventLocation,
      description: description,
      setupTime: setupTime,
      eventStart: eventStart,
      eventEnd: eventEnd,
      jobStatus: status,
    );
  }

  static JobStatus parseStatus(String status) {
    switch (status) {
      case 'setup_not_yet_begun':
        return JobStatus.setupNotYetBegun;
      case 'setup_in_progress':
        return JobStatus.setupInProgress;
      case 'setup_completed':
        return JobStatus.setupComplete;
      case 'strike_in_progress':
        return JobStatus.strikeInProgress;
      case 'strike_completed':
        return JobStatus.strikeComplete;

      default:
        throw 'Invalid job status string from server';
    }
  }
}
