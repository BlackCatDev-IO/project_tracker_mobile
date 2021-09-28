import 'package:black_cat_lib/widgets/my_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hc_labor_tracker/controllers/view_controller.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class MyAppBar extends GetView<ViewController> with PreferredSizeWidget {
  final bool isTabBar;
  const MyAppBar({required this.isTabBar});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        maavsLogoPath,
        height: 200,
        width: 200,
      ),
      toolbarHeight: 120,
      bottom: isTabBar ? const MyTabBar() : null,
      automaticallyImplyLeading: isTabBar ? false : true,
      leading: isTabBar
          ? IconButton(
              icon: const Icon(Icons.menu, color: Colors.white38),
              onPressed: () {},
            )
          : null,
      // backgroundColor: Colors.grey[900],
      centerTitle: true,
      actions: isTabBar
          ? [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ),
            ]
          : null,
      iconTheme: const IconThemeData(color: Colors.white38),
      elevation: 15.0,
    );
  }

  @override
  // Size get preferredSize => Size.fromHeight(controller.appBarHeight.h);
  Size get preferredSize => const Size.fromHeight(140);
}

class MyTabBar extends GetView<ViewController> with PreferredSizeWidget {
  const MyTabBar();

  @override
  Size get preferredSize => const Size.fromHeight(50);

  // Size get preferredSize => Size.fromHeight(controller.appBarHeight.h);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller.tabController,
      tabs: const [
        LaborTab(tabTitle: 'Today'),
        LaborTab(tabTitle: 'Schedule'),
      ],
    );
  }
}

class LaborTab extends StatelessWidget {
  final String tabTitle;
  const LaborTab({required this.tabTitle});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: GetBuilder<ViewController>(
        builder: (controller) {
          return MyTextWidget(
            text: tabTitle,
            fontSize: 10.sp,
          );
        },
      ),
    );
  }
}
