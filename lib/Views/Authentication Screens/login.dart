import 'package:estibafy_user/Controller/Authentication%20Screens%20Controllers/login_controlller.dart';
import 'package:estibafy_user/models/Classes/Authentication%20Widgets/authentication_form.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.secondaryColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: const LoginForm(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
