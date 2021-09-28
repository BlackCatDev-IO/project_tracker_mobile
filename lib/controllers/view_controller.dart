import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/view/tabs/schedule_tab.dart';
import 'package:hc_labor_tracker/view/tabs/today_jobs_tab.dart';

class ViewController extends GetxController with SingleGetTickerProviderMixin {
  late final TabController tabController;

  final tabs = const <Widget>[TodayJobs(), ScheduleTab()];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }
}
