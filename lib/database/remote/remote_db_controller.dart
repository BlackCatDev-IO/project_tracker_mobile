import 'package:get/get.dart';
import 'package:hc_labor_tracker/models/job_model.dart';
import 'package:hc_labor_tracker/network/api_caller.dart';

class RemoteDBController extends GetxController {
  static RemoteDBController get to => Get.find();
  final apiCaller = APICaller();

  Future<List<JobModel>> initFromRemoteDB() async {
    final response = await apiCaller.fetchRemoteJobData();
    final jobList = <JobModel>[];
    for (final index in response) {
      final job = JobModel.fromJson(index as Map<String, dynamic>);
      jobList.add(job);
    }
    return jobList;
  }

  void updateJobOnServer({required JobModel job}) {
    final jobMap = job.toJson();
    apiCaller.updateJob(job: jobMap);
  }
}
