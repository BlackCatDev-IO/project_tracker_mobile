import 'dart:developer';

import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'job_controller.dart';

class SocketIOController extends GetxController {
  static SocketIOController get to => Get.find();
  static const sockerURL = 'https://ancient-ocean-90103.herokuapp.com/';
  static const socketEvent = 'job_added';

  final socket = IO.io(sockerURL, <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false,
  });

  @override
  void onInit() {
    super.onInit();
    _connect();
  }

  @override
  void onClose() {
    super.onClose();
    socket.close();
  }

  void _connect() {
    socket.connect();
    socket.onConnect((data) {
      log('Connected ${socket.connected}');
    });
    socket.on(socketEvent, (message) {
      JobController.to.receiveNewJobFromServer(message as Map<String, dynamic>);
    });
  }
}
