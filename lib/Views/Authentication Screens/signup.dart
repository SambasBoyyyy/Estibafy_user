import 'package:estibafy_user/Controller/Authentication%20Screens%20Controllers/signup_controller.dart';
import 'package:estibafy_user/models/Classes/Authentication%20Widgets/authentication_form.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: signUpController.getAppBar(),
      backgroundColor: K.secondaryColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SignUpForm(),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Align(
          alignment: Alignment.topCenter,
          child: RichText(
            text: TextSpan(
              text: 'Already a member?',
              style: K.textStyle2,
              children: <TextSpan>[
                TextSpan(
                  text: '  Log in',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(const Login()),
                  style: K.textStyle2.copyWith(
                      color: K.tertiaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
