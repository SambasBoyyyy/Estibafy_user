import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/models/invoices_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart';

class WebAPIs {
  // static String baseURL = 'https://container.linktoeat.com/api/';
  // static String baseURL = 'http://64.227.183.182/public/index.php/api/';
  static String baseURL =
      'http://149.102.158.40/container/public/index.php/api/';

  static void sendNotificationToken({
    required String token,
  }) async {
    Map<String, String> body = {
      "fcm_token": token,
    };
    Response r = await post(
      Uri.parse(baseURL + 'fcmtoken/add'),
      headers: getAuthHeader(),
      body: body,
    );
  }

  static Future<Map<String, dynamic>?> getJobs() async {
    Response r = await get(
      Uri.parse(baseURL + 'get/jobs'),
      headers: getAuthHeader(),
    );
    log(r.body);
    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> forgotPassword(
      {required String email}) async {
    Response r = await post(
      Uri.parse(baseURL + 'forgotPassword'),
      body: {"email": email},
    );

    if (r.statusCode == 200) {
      return json.decode(r.body);
    }
    return json.decode(r.body);
  }

  static Future<Map<String, dynamic>?> getJobDetails(
      {required int jobId}) async {
    Response r = await get(
      Uri.parse(baseURL + 'job/detail/$jobId'),
      headers: getAuthHeader(),
    );

    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> jobCheckout({
    required String jobID,
    // required String packageType,
    // required String startTime,
    // required String endTime,
    required String totalHelpers,
    required int paymentMethod,
    // required String address,
    // required String helpers,
  }) async {
    Map<String, String> body = {
      "job_id": jobID,
      //"package_type": packageType,
      //"start_time": startTime,
      //"end_time": endTime,
      "payement_method": "$paymentMethod",
      "total_helpers": totalHelpers,
      //"address": address,
      // "helpers": helpers,
    };
    Response r = await post(
      Uri.parse(baseURL + 'job/checkout'),
      headers: getAuthHeader(),
      body: body,
    );

    if (validateResponse(r)) {
      print(r.body);
      return json.decode(r.body);
    }
    return null;
  }

  static Future<InvoiceModel> getInvoice(int id) async {
    final queryParameters = {
      "user_id": "$id",
    };

    final uri = Uri.http('149.102.158.40',
        '/container/public/index.php/api/invoices', queryParameters);
    Response r = await get(
      uri,
      headers: getAuthHeader(),
    );

    if (validateResponse(r)) {
      return InvoiceModel.fromJson(jsonDecode(r.body));
    }
    return InvoiceModel.fromJson(jsonDecode(r.body));
  }


  static Future<Response> updateProfile({
    required var body,


  }) async {

    print("body=== ${body}");
    Response r = await post(
      Uri.parse(baseURL + "usersUpdate"),
      headers: getAuthHeader(),
      body: body,
    );
    print("response.body=== ${r.body}");

      return r;

  }




  static Future<Map<String, dynamic>?> bookHelper({
    required int jobId,
    required String jobName,
    required String jobAddress,
    required int containerId,
    required String packageType,
    required String startTime,
    required String endTime,
    required int helpersSize,
    required String helpers,
    required String lat,
    required String lng,
    File? image,
    File? voicemail,
  }) async {
    Map<String, String> body = {
      'name': jobName,
      "address": jobAddress,
      "container_id": containerId.toString(),
      "package_type": packageType,
      "start_time": startTime,
      "end_time": endTime,
      "image": "",
      "voice": "",
      "helpers": helpers,
      "latitude": lat.toString(),
      "longitude": lng.toString(),
      "helper_size": helpersSize.toString(),
    };

    print("body=== ${body}");
    Response r = await post(
      Uri.parse(baseURL + 'job/post'),
      headers: getAuthHeader(),
      body: body,
    );
    print("response.body=== ${r.body}");
    if (validateResponse(r)) {
      return json.decode(r.body);
    }
  }

  static Future<Map<String, dynamic>?> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String id,
    required String userType,
    required String confirmPassword,
    File? image,
    String? govtId,
    required double lat,
    required double lng,
  }) async {
    Map<String, String> body = {
      'name': name,
      'email': email,
      'mobile': phone,
      'password': password,
      'id': id,
      "user_type": userType,
      "password_confirm": confirmPassword,
      "goverment_id": govtId ?? "12",
      "latitude": '$lat',
      "longitude": '$lng'
    };

    Response r = await post(
      Uri.parse(baseURL + 'usersCreate'),
      body: body,
    );
    print(r.body);
    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> signIn({
    required String email,
    required String password,
    required String deviceID,
  }) async {
    Map<String, String> body = {
      'email': email,
      'password': password,
    };
    if (Platform.isAndroid) {
      body['device_token'] = deviceID;
    }
    if (Platform.isIOS) {
      body['device_token'] = deviceID;
    }
    print("calling api");
    print(baseURL + 'login');
    Response r = await post(
      Uri.parse(baseURL + 'login'),
      body: body,
    );
    print(r.body);
    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future<bool> signOut(String token) async {
    Response r = await get(
      Uri.parse(baseURL + 'logout'),
      headers: getAuthHeader(),
    );
    return validateResponse(r);
  }

  static bool validateResponse(Response r) {
    final Map<String, dynamic> body;
    try {
      body = json.decode(r.body);
      if (r.statusCode == 200) {
        return true;
      } else {
        String errorMessage =
            body['message']; //getErrorMessage(body['message']);
        K.showToast(message: errorMessage);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<Map<String, dynamic>?> otpVerify({
    required String otpCode,
    required String mobile,
    required String deviceID,
  }) async {
    Map<String, String> body = {
      'verification_code': otpCode,
      'mobile': mobile,
    };
    if (Platform.isAndroid) {
      body['device_token'] = deviceID;
    }
    if (Platform.isIOS) {
      body['device_token'] = deviceID;
    }
    print("calling api");
    Response r = await post(
      Uri.parse(baseURL + 'verifyOtp'),
      body: body,
    );
    log('------------r.body------------${r.body}');
    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static Future deleteAccount() async {
    Response r = await post(Uri.parse(baseURL + "account/delation"),
        headers: getAuthHeader());

    if (validateResponse(r)) {
      return;
    } else {
      return null;
    }
  }

  static Future<Map<String, dynamic>?> resendOtp({
    required String mobile,
    required String deviceID,
  }) async {
    Map<String, String> body = {
      'mobile': mobile,
    };
    if (Platform.isAndroid) {
      body['device_token'] = deviceID;
    }
    if (Platform.isIOS) {
      body['device_token'] = deviceID;
    }
    print("calling api");
    Response r = await post(
      Uri.parse(baseURL + 'resendOtp'),
      body: body,
    );
    log('------------r.body------------${r.body}');
    if (validateResponse(r)) {
      return json.decode(r.body);
    }
    return null;
  }

  static String getErrorMessage(Map<String, dynamic> errors) {
    String errorMessage = '';
    for (var i in errors.keys) {
      final error = errors[i];
      errorMessage +=
          error.toString().replaceAll('[', '').replaceAll(']', '') + '\n';
    }
    if (errorMessage.contains('\n')) {
      return errorMessage.substring(0, errorMessage.length - 1);
    }

    return errorMessage;
  }

  static Map<String, String> getAuthHeader() {
    final UserController _controller = Get.find(tag: K.userControllerTag);
    log(_controller.userToken);
    return {
      HttpHeaders.authorizationHeader: 'Bearer ${_controller.userToken}',
    };
  }
}
