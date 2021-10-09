import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/database/remote/remote_db_controller.dart';
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
  List<Map<String, dynamic>> mapJobList = [];

  int selectedJobIndex = 0;

  JobStatus jobStatus = JobStatus.setupNotYetBegun;

  late TimeOfDay jobActionTime;

  final textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // _initJobList();
    initJobListFromServer();
  }

  void selectJob({required int index}) {
    selectedJobIndex = index;
    textController.clear();
    Get.toNamed(SelectedJobScreen.id);
  }

  Future<void> jobAction({
    required JobStatus status,
    required BuildContext toastContext,
  }) async {
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
      if (selectedJob.mongoDbObjectId == model.mongoDbObjectId) {
        selectedJob.jobStatus = status;
        update();
      }
    }
    RemoteDBController.to.updateJobOnServer(job: selectedJob);
  }

  void updateJob() {}

  Future<void> _editTime() async {
    final pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      context: Get.context!,
    );
    jobActionTime = pickedTime!;
  }

  Future<void> initJobListFromServer() async {
    jobList = await RemoteDBController.to.initFromRemoteDB();
    update();
  }
}
