import 'package:easy_localization/easy_localization.dart';
import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/utils/constants.dart';
import '../../models/widgets/inputwidgets.dart';
import '../../models/widgets/pressedwidget.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.secondaryColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/estibafyfulllogo.jpeg'),
              width: 350,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Please enter your email\nto reset password',
              style: K.textStyle3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 80,
            ),
            input(
                text: tr('Email'),
                controller: emailController,
                prefix: Icons.mail,
                onChanged: (value) {}),
            const SizedBox(
              height: 30.0,
            ),
            customButton(
                function: () {
                  UserController userController =
                      Get.find(tag: K.userControllerTag);
                  userController.forgotPassword(emailController.text);
                },
                text: tr('Enter'),
                textColor: K.secondaryColor,
                arrowColor: K.secondaryColor,
                fillColor: K.primaryColor,
                borderColor: K.primaryColor,
                height: 55.0,
                margin: 10.0),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
