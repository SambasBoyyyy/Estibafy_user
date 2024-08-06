import 'dart:io';

import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../Views/pages/book_helpers/book_helpers_sheet.dart';
import '../../models/Classes/webapis.dart';

class BookHelperDataCollectionController extends GetxController {
  RxInt cupertinoTabBarIIIValue = 0.obs;

  final checkedValuesList = [].obs;
  final container = [].obs;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController jobNameController = TextEditingController();

  TimeOfDay selectedStartTime = TimeOfDay.now();

  TimeOfDay selectedEndTime = TimeOfDay.now();

  String startDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String startTime = DateFormat("HH:MM").format(DateTime.now());

  String endDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String endTime = DateFormat("HH:MM").format(DateTime.now());

  String address = "";
  String cargoTypeBox = "1";
  String packageType = "box";
  int helpersSize = 5;
  String helpers = "sds";
  int jobId = 2;
  int containerId = 2;
  String jobName = "abc";

  RxBool openBottomSheet = false.obs;

  RxInt paymentMethod = 2.obs;

  //Cargo Type
  RxBool container20feet = false.obs;
  RxBool container40feet = false.obs;
  RxBool cargoSuelta = false.obs;
  //Packaging Type
  RxBool boxes = false.obs;
  RxBool pallets = false.obs;
  RxBool sacos = false.obs;
  RxBool tanks = false.obs;
  RxBool bidones = false.obs;
  RxBool others = false.obs;

  void bookHelper({
    required int jobId,
    required String jobName,
    required String jobAddress,
    required int containerId,
    required String packageType,
    required String startTime,
    required String endTime,
    required String lat,
    required String lng,
    required String helperSize,
    required RxInt paymentMethod,
    File? image,
    File? voicemail,
  }) async {
    EasyLoading.show();
    if (jobId != null && jobName != null) {
      print("im going to call apis");
      final Map<String, dynamic>? result = await WebAPIs.bookHelper(
        endTime: endTime,
        jobName: jobName,
        jobId: jobId,
        jobAddress: jobAddress,
        packageType: packageType,
        containerId: containerId,
        startTime: startTime,
        helpersSize: helpersSize,
        helpers: helpers,
        image: image,
        lat: lat,
        lng: lng,
      );

      if (result != null) {
        result['payment-method'] = paymentMethod;
        Get.bottomSheet(BookHelperSheet(response: result));
        // openBottomSheet.value = true;
      } else {
        K.showToast(message: 'Error Calling API');
      }
    }

    EasyLoading.dismiss();
  }

  final picker = ImagePicker();
}
