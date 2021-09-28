import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'controllers/event_location_controller.dart';
import 'controllers/theme_controller.dart';
import 'controllers/view_controller.dart';
import 'routes/app_routes.dart';
import 'view/screens/home_page.dart';
import 'package:black_cat_lib/black_cat_lib.dart';

import 'view/toasts/toasts.dart';

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
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        // home: const TestStateful(),
        home: const HomePage(),
        getPages: AppRoutes.pages,
        theme: ThemeController.to.theme,
        defaultTransition: Transition.fade,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

class TestStateful extends StatefulWidget {
  const TestStateful({Key? key}) : super(key: key);

  @override
  _TestStatefulState createState() => _TestStatefulState();
}

class _TestStatefulState extends State<TestStateful> {
  @override
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
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            width: 12.0,
          ),
          MyTextWidget(text: "This is a Custom Toast", color: Colors.black),
        ],
      ),
    );

    fToast.showToast(
      child: ToastWidget(
        toastText: 'Fah Q',
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          _showToast();
        },
        child: const Text('test'),
      )),
    );
  }
}
