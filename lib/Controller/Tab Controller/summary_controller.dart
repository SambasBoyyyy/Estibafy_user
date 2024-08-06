import 'package:estibafy_user/models/Classes/webapis.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController {
  RxBool isMasterCard = true.obs;
  RxBool isCreditCard = false.obs;

  Future<int?> jobCheckout({
    required int helperCount,
    required int paymentMethod,
    required Map<String, dynamic> data,
  }) async {
    EasyLoading.show();
    print("calling job checkout api");
    Map<String, dynamic>? response = await WebAPIs.jobCheckout(
      jobID: data['job_id'].toString(),
      paymentMethod: paymentMethod,
      // packageType: data['job_detail']['package_type'],
      // startTime: data['job_detail']['start_time'],
      //endTime: data['job_detail']['end_time'],
      totalHelpers: helperCount.toString(),
      //address: data['job_detail']['address'],
      //helpers: helperCount.toString(),
    );

    EasyLoading.dismiss();

    try {
      return response!['data']['order_id'];
    } catch (e) {
      return null;
    }
  }
}
