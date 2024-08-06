

import 'package:flutter/foundation.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';

class TrackingController extends GetxController{
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10000;
  CountdownTimerController? controller;
  void onEnd() {
    if (kDebugMode) {
      print('onEnd');
    }
  }

  void initState() {
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

}