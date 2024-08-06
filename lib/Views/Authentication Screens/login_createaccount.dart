import 'package:easy_localization/easy_localization.dart';
import 'package:estibafy_user/Views/Authentication%20Screens/signup.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class LoginOrCreateAccount extends StatelessWidget {
  const LoginOrCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/bg.jpeg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              K.secondaryColor.withOpacity(0.3),
              BlendMode.lighten,
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Image(
                          image: AssetImage('assets/logo.png'),
                          width: 110,
                        ),
                        Text(
                          'Estibafy',
                          style: K.titleTextStyle,
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Login());
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: K.secondaryColor, backgroundColor: K.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
                          )),
                      child: Text(
                        'Log in',
                        style: K.textStyle3.copyWith(color: K.secondaryColor),
                      ).tr(),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Get.to(const SignUp());
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
                        side: BorderSide(color: K.secondaryColor),
                      )),
                      child: Text(
                        'Create Account',
                        style: K.textStyle3.copyWith(
                            color: K.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ).tr(),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
