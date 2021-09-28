import 'package:black_cat_lib/widgets/my_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hc_labor_tracker/models/job_status_display_model.dart';

class JobStatusDisplayWigget extends StatelessWidget {
  final JobStatusDisplayModel model;
  const JobStatusDisplayWigget(this.model);

  @override
  Widget build(BuildContext context) {
    return MyTextWidget(
        text: model.statusText, color: model.statusColor, fontSize: 20);
  }
}
