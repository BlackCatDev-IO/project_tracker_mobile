import 'package:enum_to_string/enum_to_string.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';

class JobModel {
  String mongoDbObjectId;
  String jobCode;
  String jobTitle;
  String eventLocation;
  String? description;
  DateTime setupTime, eventStart, eventEnd;
  JobStatus jobStatus;

  JobModel({
    required this.mongoDbObjectId,
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
    return JobModel(
      mongoDbObjectId: json['_id'] as String,
      jobCode: json['jobCode'] as String,
      jobTitle: json['jobTitle'] as String,
      eventLocation: json['eventLocation'] as String,
      description: json['description'] as String? ?? '',
      setupTime: DateTime.parse(json['setupTime'] as String),
      eventStart: DateTime.parse(json['eventStart'] as String),
      eventEnd: DateTime.parse(json['eventEnd'] as String),
      jobStatus: EnumToString.fromString(
        JobStatus.values,
        json['jobStatus'] as String,
      )!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': mongoDbObjectId,
      'jobCode': jobCode,
      'jobTitle': jobTitle,
      'eventLocation': eventLocation,
      'description': description,
      'setupTime': setupTime.toString(),
      'eventStart': eventStart.toString(),
      'eventEnd': eventEnd.toString(),
      'jobStatus': EnumToString.convertToString(jobStatus),
    };
  }
}
