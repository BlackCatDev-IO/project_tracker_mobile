import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/view_controller.dart';
import 'package:hc_labor_tracker/view/widgets/my_app_bar.dart';

class HomePage extends GetView<ViewController> {
  static const id = '/home_page';
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        isTabBar: true,
      ),
      body: TabBarView(
        controller: controller.tabController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: controller.tabs,
      ),
    );
  }
}
