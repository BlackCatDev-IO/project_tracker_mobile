import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'controllers/event_location_controller.dart';
import 'controllers/theme_controller.dart';
import 'controllers/view_controller.dart';
import 'routes/app_routes.dart';
import 'view/screens/home_page.dart';

void main() {
  Get.put(EventLocationController());
  Get.put(ViewController());
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          home: const HomePage(),
          getPages: AppRoutes.pages,
          theme: ThemeController.to.theme,
          defaultTransition: Transition.fade,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
