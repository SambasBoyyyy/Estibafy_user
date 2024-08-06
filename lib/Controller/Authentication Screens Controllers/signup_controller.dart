import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxInt cupertinoTabBarIIIValue = 0.obs;
  bool isPasswordVisible = true;
  String email = '';
  String phone = '';
  String name = '';
  String password = '';
  String id = "";
  //initial user Type is 0 for person selected in drop down
  String userType = "0";
  String confirmPassword = "";

  RxBool isChecked = false.obs;
  // Person SignUp Controllers
  TextEditingController personNameController = TextEditingController();
  TextEditingController personLastNameController = TextEditingController();
  TextEditingController personEmailController = TextEditingController();
  TextEditingController personMobileController = TextEditingController();
  TextEditingController personIDController = TextEditingController();
  TextEditingController personPasswordController = TextEditingController();
  TextEditingController personConfirmPasswordController =
      TextEditingController();
  // Company SignUp Controllers
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyLastNameController = TextEditingController();
  TextEditingController companyEmailController = TextEditingController();
  TextEditingController companyMobileController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController companyRUCController = TextEditingController();
  TextEditingController companyPasswordController = TextEditingController();
  TextEditingController companyConfirmPasswordController = TextEditingController();

  getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 50,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            FontAwesomeIcons.arrowCircleLeft,
            color: K.primaryColor,
          )),
    );
  }
}
