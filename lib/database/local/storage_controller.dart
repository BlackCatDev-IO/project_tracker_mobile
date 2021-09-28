import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  static StorageController get to => Get.find();

  final jobBox = GetStorage();
}
