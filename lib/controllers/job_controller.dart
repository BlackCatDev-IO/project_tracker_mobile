import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/event_location_controller.dart';
import 'package:hc_labor_tracker/models/job_model.dart';
import 'package:hc_labor_tracker/view/screens/home_page.dart';
import 'package:hc_labor_tracker/view/screens/selected_job_screen.dart';
import 'package:hc_labor_tracker/view/toasts/toasts.dart';

enum JobStatus {
  setupNotYetBegun,
  setupInProgress,
  setupComplete,
  strikeInProgress,
  strikeComplete,
}

class JobController extends GetxController {
  static JobController get to => Get.find();

  List<JobModel> jobList = [];

  int selectedJobIndex = 0;

  JobStatus jobStatus = JobStatus.setupNotYetBegun;

  late TimeOfDay jobActionTime;

  final textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _initJobList();
  }

  void selectJob({required int index}) {
    selectedJobIndex = index;
    textController.clear();
    Get.toNamed(SelectedJobScreen.id);
  }

  Future<void> jobAction(
      {required JobStatus status, required BuildContext toastContext}) async {
    jobActionTime = TimeOfDay.now();

    switch (status) {
      case JobStatus.setupInProgress:
        await _editTime();
        Toasts.setupHasBegun(toastContext);
        break;
      case JobStatus.setupComplete:
        Get.toNamed(HomePage.id);
        Toasts.setupComplete(toastContext);
        break;
      case JobStatus.strikeInProgress:
        Toasts.strikeInProgress(toastContext);
        break;
      case JobStatus.strikeComplete:
        Get.toNamed(HomePage.id);
        Toasts.strikeComplete(toastContext);
        break;
      case JobStatus.setupNotYetBegun:
        throw 'setupNotYetBegun is not a status that should be passed into jobAction funciton';
    }
    _updateJobStatus(status: status);
  }

  void _updateJobStatus({required JobStatus status}) {
    final selectedJob = jobList[selectedJobIndex];
    for (final model in jobList) {
      if (selectedJob.jobCode == model.jobCode) {
        selectedJob.jobStatus = status;
        update();
      }
    }
  }

  Future<void> _editTime() async {
    final pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      context: Get.context!,
    );
    jobActionTime = pickedTime!;
  }

  /// mock data for now -- real data to be populated from server
  void _initJobList() {
    final model1 = JobModel(
        jobCode: 'C32434',
        jobTitle: 'President of Ghana',
        eventLocation: EventLocationController.to.eventLocationList[0],
        setupTime: DateTime(2021, 9, 26, 6),
        eventStart: DateTime(2021, 9, 26, 8),
        eventEnd: DateTime(2021, 9, 26, 12));

    final model2 = JobModel(
        jobCode: 'C30643',
        jobTitle: 'Harvard Hall Gala 2021',
        eventLocation: EventLocationController.to.eventLocationList[1],
        setupTime: DateTime(2021, 9, 26, 7),
        eventStart: DateTime(2021, 9, 26, 9),
        eventEnd: DateTime(2021, 9, 26, 13));

    final model3 = JobModel(
        jobCode: 'C345689',
        jobTitle: 'Harvard Fundraiser Dinner',
        eventLocation: EventLocationController.to.eventLocationList[2],
        setupTime: DateTime(2021, 9, 26, 8),
        eventStart: DateTime(2021, 9, 26, 9),
        eventEnd: DateTime(2021, 9, 26, 11));

    final model4 = JobModel(
        jobCode: 'C323569',
        jobTitle: 'Investor Meeting',
        eventLocation: EventLocationController.to.eventLocationList[1],
        setupTime: DateTime(2021, 9, 26, 9),
        eventStart: DateTime(2021, 9, 26, 10),
        eventEnd: DateTime(2021, 9, 26, 14));

    final model5 = JobModel(
        jobCode: 'C323568',
        jobTitle: 'Insurance Meeting',
        eventLocation: EventLocationController.to.eventLocationList[1],
        setupTime: DateTime(2021, 9, 26, 9, 30),
        eventStart: DateTime(2021, 9, 26, 12),
        eventEnd: DateTime(2021, 9, 26, 13));

    final model6 = JobModel(
        jobCode: 'C29535',
        jobTitle: 'Alumni Party',
        eventLocation: EventLocationController.to.eventLocationList[1],
        setupTime: DateTime(2021, 9, 26, 15),
        eventStart: DateTime(2021, 9, 26, 20),
        eventEnd: DateTime(2021, 9, 26, 23));

    jobList.add(model1);
    jobList.add(model2);
    jobList.add(model3);
    jobList.add(model4);
    jobList.add(model5);
    jobList.add(model6);
  }
}
