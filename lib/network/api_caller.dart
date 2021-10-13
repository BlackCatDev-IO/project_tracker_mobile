import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect.dart';

class APICaller extends GetConnect {
  static const url = 'https://ancient-ocean-90103.herokuapp.com/db';

  Future<List> fetchRemoteJobData() async {
    final response = await httpClient.get(url);
    return response.body as List;
  }

  void updateJob({required Map<String, dynamic> job}) {
    log('apiCaller update job');
    httpClient.put(
      url,
      body: jsonEncode(job),
    );
  }
}
