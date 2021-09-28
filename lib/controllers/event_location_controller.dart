import 'package:get/get.dart';

class EventLocationController extends GetxController {
  static EventLocationController get to => Get.find();

  final eventLocationList = <String>[
    'Bittle',
    'Harvard Hall',
    'Dining Room',
    'West Room',
    'TBD'
  ];
}
