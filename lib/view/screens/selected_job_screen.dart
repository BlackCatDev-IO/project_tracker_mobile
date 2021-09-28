import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/job_controller.dart';
import 'package:black_cat_lib/black_cat_lib.dart';
import 'package:hc_labor_tracker/utils/job_status_formatter.dart';
import 'package:hc_labor_tracker/view/widgets/buttons/end_setup_button.dart';
import 'package:hc_labor_tracker/view/widgets/buttons/start_setup_button.dart';
import 'package:hc_labor_tracker/view/widgets/job_widget.dart';
import 'package:hc_labor_tracker/view/widgets/my_app_bar.dart';
import 'package:hc_labor_tracker/view/widgets/textfields/setup_notes_textfield.dart';

class SelectedJobScreen extends GetView<JobController> {
  static const id = '/selected_job_screen';
  const SelectedJobScreen();

  @override
  Widget build(BuildContext context) {
    final currentJob = controller.jobList[controller.selectedJobIndex];

    return Scaffold(
      appBar: const MyAppBar(
        isTabBar: false,
      ),
      body: GetBuilder<JobController>(
        builder: (_) {
          final statusDisplayModel =
              JobStatusFormatter.statusDisplay(status: currentJob.jobStatus);
          return Column(
            children: [
              sizedBox5High,
              JobWidget(model: currentJob),
              currentJob.jobStatus == JobStatus.setupInProgress
                  ? MyTextWidget(
                      text: statusDisplayModel.statusText,
                      color: Colors.green,
                      fontSize: 20)
                  : const SizedBox(),
              const SetupNotesTextfield(),
              const Spacer(),
              currentJob.jobStatus == JobStatus.setupInProgress
                  ?  EndSetupButton(context)
                  :  StartSetupButton(context),
              const SizedBox(height: 50),
            ],
          ).paddingSymmetric(horizontal: 10);
        },
      ),
    );
  }
}

class ToastTest extends StatefulWidget {
  const ToastTest({Key? key}) : super(key: key);

  @override
  _ToastTestState createState() => _ToastTestState();
}

class _ToastTestState extends State<ToastTest> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        _showToast();
      },
      child: Text('data'),
    )));
  }
}

