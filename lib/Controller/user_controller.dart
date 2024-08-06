import 'dart:convert';
import 'dart:developer';
import 'dart:io';

//import 'package:device_info_plus/device_info_plus.dart';
import 'package:estibafy_user/Views/Authentication%20Screens/login.dart';
import 'package:estibafy_user/Views/Authentication%20Screens/login_createaccount.dart';
import 'package:estibafy_user/Views/pages/book_helpers/home.dart';
import 'package:estibafy_user/models/Classes/user.dart';
import 'package:estibafy_user/models/Classes/webapis.dart';
import 'package:estibafy_user/models/Example%20Object/example_objects.dart';
import 'package:estibafy_user/models/fcm_notifications.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../Views/pages/navigationbar.dart';
import '../show_messages.dart';

class UserController extends GetxController {
  Rx<User> user = ExampleObjects.user.obs;
  late String userToken;

  TextEditingController contactControllerSignup = TextEditingController();
  TextEditingController nameControllerSignup = TextEditingController();
  TextEditingController passwordControllerSignup = TextEditingController();
  TextEditingController confirmPasswordControllerSignup = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    var localUserData = K.localStorage.read(K.userControllerTag);
    if (localUserData != null) {
      user.value = User.fromJson(localUserData);
      // Update text controllers with the loaded data
      nameControllerSignup.text = user.value.name ?? '';
      contactControllerSignup.text = user.value.phoneNumber ?? '';
      confirmPasswordControllerSignup.text = user.value.password ?? '';
    }
  }

  Future<void> updateProfile() async {
    var body = {
      "mobile": contactControllerSignup.text == '' ? user.value.phoneNumber : contactControllerSignup.text,
      "name": nameControllerSignup.text == '' ? user.value.name : nameControllerSignup.text,
      "password": confirmPasswordControllerSignup.text == '' ? user.value.password : confirmPasswordControllerSignup.text,
      "password_confirm": confirmPasswordControllerSignup.text == '' ? user.value.password : confirmPasswordControllerSignup.text,
    };

    EasyLoading.show(status: 'Updating...');

    try {
      final response = await WebAPIs.updateProfile(body: body);
      var data = jsonDecode(response.body);
      if (response != null && data['status'] == 200) {
        print("Old User: ${user.value.name}");

        var updatedUser = User(
          name: nameControllerSignup.text == '' ? user.value.name : nameControllerSignup.text,
          email: user.value.email,
          userId: user.value.userId,
          phoneNumber: contactControllerSignup.text == '' ? user.value.phoneNumber : contactControllerSignup.text,
          paymentDays: user.value.paymentDays,
          password: confirmPasswordControllerSignup.text == '' ? user.value.password : confirmPasswordControllerSignup.text,
        );

        // Check if there are any changes
        if (user.value.name != updatedUser.name ||
            user.value.phoneNumber != updatedUser.phoneNumber ||
            user.value.password != updatedUser.password) {
          user.value = updatedUser;

          // Update the UserController tag locally
          K.localStorage.write(K.userControllerTag, user.value.toJson());
          var localUserData = K.localStorage.read(K.userControllerTag);
          var originalUser = User.fromJson(localUserData);
          print("Updated User: ${originalUser.name}");
        } else {
          print("No changes were made to the user profile.");
        }
      } else {
        ShowMessage().showErrorMessage('Update failed');
      }
    } catch (e) {
      ShowMessage().showErrorMessage(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }






  void signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String id,
    required String userType,
    File? image,
    String? govtId,
    required double lat,
    required double lng,
  }) async {
    EasyLoading.show();

    String? deviceTypes;
    String? deviceID;

    print("im going to call apis");
    final Map<String, dynamic>? result = await WebAPIs.signup(
        id: id,
        name: name,
        email: email,
        phone: phone,
        password: password,
        userType: userType,
        confirmPassword: confirmPassword,
        govtId: govtId,
        lat: lat,
        lng: lng);

    if (result != null) {
      user.value = User(
        name: name,
        email: email,
        userId: id,
        phoneNumber: phone,
        password: password,
      );

       K.localStorage.write(
           K.loggedInUser, result['data']['token']['access_token'].toString());
       userToken = result['data']['token']['access_token'];
      K.localStorage
          .write(result['data']['token']['access_token'], user.value);
      K.localStorage.write(K.userControllerTag, user.value.toJson());
      Get.to(const Home());
      K.showToast(message: 'Welcome ${user.value.name}');
      String? token = await FCMNotifications.messaging.getToken();
      if (token != null) {
        WebAPIs.sendNotificationToken(token: token);
      }
    }
    EasyLoading.dismiss();
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    EasyLoading.show();

    String? deviceID;
    deviceID='1';
    // if (Platform.isAndroid) {
    //    //AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
    //   // deviceID = deviceInfo.id;
    // } else if (Platform.isIOS) {
    //   // IosDeviceInfo deviceInfo = await DeviceInfoPlugin().iosInfo;
    //   // deviceID = deviceInfo.identifierForVendor;
    // }

    if (deviceID != null) {
      print("im going to call apis");
      log(deviceID);
      final Map<String, dynamic>? result = await WebAPIs.signIn(
        email: email,
        password: password,
        deviceID: deviceID,
      );

      if (result != null && result['status']==200) {
        user.value = User(
          name: result['data']['user']['name'],
          email: email,
          userId: result['data']['user']['id'].toString(),
          phoneNumber: result['data']['user']['mobile'],
          paymentDays: result['data']['user']['payment_days'],
          password: password,
        );

        K.localStorage
            .write(K.loggedInUser, result['data']['token']['access_token']);
        userToken = result['data']['token']['access_token'];
        K.localStorage
            .write(result['data']['token']['access_token'], user.value);
        K.localStorage.write(K.userControllerTag, user.value.toJson());

        K.showToast(message: 'Welcome ${user.value.name}');
        Get.offAll(() => const NavBar());
        String? token = await FCMNotifications.messaging.getToken();
        print("fcm token is " + token!);
        if (token != null) {
          WebAPIs.sendNotificationToken(token: token);
        }
      }
    }

    EasyLoading.dismiss();
  }

  // Firebase OTP Verifications
  void otpVerify({
    required String otp,
    required String mobile,
  }) async {
    EasyLoading.show();

    print("im going to call apis");
    final Map<String, dynamic>? result = await WebAPIs.otpVerify(
      otpCode: otp,
      mobile: mobile,
      deviceID: '',
    );

    if (result != null) {
      K.showToast(message: '${result['message']}');
      Get.offAll(() => const NavBar());
      String? token = await FCMNotifications.messaging.getToken();
      if (token != null) {
        WebAPIs.sendNotificationToken(token: token);
      }
    }

    EasyLoading.dismiss();
  }

  void resendOTP({
    required String mobile,
  }) async {
    EasyLoading.show();

    String? deviceID;

    if (Platform.isAndroid) {
      // AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;
      // deviceID = deviceInfo.id;
    } else if (Platform.isIOS) {
      // IosDeviceInfo deviceInfo = await DeviceInfoPlugin().iosInfo;
      // deviceID = deviceInfo.identifierForVendor;
    }

    if (deviceID != null) {
      print("im going to call apis");
      final Map<String, dynamic>? result = await WebAPIs.resendOtp(
        mobile: mobile,
        deviceID: deviceID,
      );

      if (result != null) {
        // user.value = User(
        //   name: result['data']['user']['name'],
        //   email: email,
        //   phoneNumber: result['data']['user']['name'],
        //   password: password,
        // );

        // K.localStorage
        //     .write(K.loggedInUser, result['data']['token']['access_token']);
        // userToken = result['data']['token']['access_token'];
        // K.localStorage
        //     .write(result['data']['token']['access_token'], user.value);

        K.showToast(message: '${result['message']}');
        // Get.offAll(() => const NavBar());
        String? token = await FCMNotifications.messaging.getToken();
        if (token != null) {
          WebAPIs.sendNotificationToken(token: token);
        }
      }
    }

    EasyLoading.dismiss();
  }

  void forgotPassword(String email) async {
    print("im going to call apis");
    EasyLoading.show();
    final Map<String, dynamic>? result =
        await WebAPIs.forgotPassword(email: email);
    EasyLoading.dismiss();
    K.showToast(message: '${result!['message']}');
    if (result['status'] == 200) {
      Get.to(const Login());
    }
  }

  void deleteAccount() {
    WebAPIs.deleteAccount();
    K.localStorage.remove(K.loggedInUser);
    K.localStorage.remove(userToken);
    Get.offAll(() => const LoginOrCreateAccount());
  }

  void signOut() async {
    EasyLoading.show();

    K.localStorage.remove(K.loggedInUser);
    K.localStorage.remove(userToken);
    Get.offAll(() => const LoginOrCreateAccount());
    K.showToast(message: 'Logged Out Successfully');

    EasyLoading.dismiss();
  }

  static Future<LocationData?> getUserLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await location.getLocation();
  }
}
