import 'package:get/get.dart';
import 'package:hc_labor_tracker/view/screens/home_page.dart';
import 'package:hc_labor_tracker/view/screens/selected_job_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: SelectedJobScreen.id, page: () => const SelectedJobScreen()),
    GetPage(name: HomePage.id, page: () => const HomePage()),
  ];
}
