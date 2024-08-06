import 'package:country_code_picker/country_code_picker.dart';
import 'package:estibafy_user/Controller/Authentication%20Screens%20Controllers/signup_controller.dart';
import 'package:estibafy_user/Views/pages/terms_conditions.dart';
import 'package:estibafy_user/models/Classes/Firebase/firebase_phone_auth.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:estibafy_user/models/widgets/pressedwidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Views/pages/sms_verification.dart';

class PersonSignUp extends StatefulWidget {
  const PersonSignUp({Key? key}) : super(key: key);

  @override
  _PersonSignUpState createState() => _PersonSignUpState();
}

class _PersonSignUpState extends State<PersonSignUp> {
  SignUpController signUpController = Get.put(SignUpController());
  //initial country code
  String countryCode = "+593 ";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        input(
            onChanged: (value) {
              signUpController.name = value;
            },
            text: 'Name',
            prefix: Icons.person,
            controller: signUpController.personNameController),
        input(
            onChanged: (value) {
              signUpController.email = value;
            },
            text: 'Email',
            prefix: Icons.email,
            controller: signUpController.personEmailController),

        Row(
          children: [
            CountryCodePicker(
              initialSelection: 'ec',
              // showFlag: false,
              onChanged: (value) {
                countryCode = value.toString();
                signUpController.phone =
                    countryCode + signUpController.personMobileController.text;
              },
            ),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: signUpController.personMobileController,
                    cursorColor: K.primaryColor,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter your number",
                      hintStyle: K.textStyle3,
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    ),
                    textAlign: TextAlign.center,
                    style: K.textStyle3,
                    onChanged: (value) {
                      signUpController.phone = countryCode +
                          signUpController.personMobileController.text;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Divider(color: K.sixthColor.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     CountryCodePicker(
        //       initialSelection: 'ec',
        //       showCountryOnly: false,
        //       showOnlyCountryWhenClosed: false,
        //       favorite: const ['+593', 'ec'],
        //       textStyle: K.textStyle3,
        //     ),
        //     input4(
        //         text: 'Mobile Number',
        //         controller:
        //         signUpController.personMobileController),
        //   ],
        // ),

        // input(
        //     onChanged: (value) {
        //       signUpController.phone = value;
        //     },
        //     text: 'Mobile Number',
        //     prefix: Icons.phone_android_outlined,
        //     controller: signUpController.personMobileController),
        // input(
        //     onChanged: (value) {
        //       signUpController.id = value;
        //     },
        //     text: 'Government I.D',
        //     prefix: Icons.person_pin_rounded,
        //     controller: signUpController.personIDController),
        input(
          onChanged: (value) {
            signUpController.password = value;
          },
          obscure: signUpController.isPasswordVisible,
          text: 'Password',
          prefix: Icons.vpn_key_outlined,
          controller: signUpController.personPasswordController,
          suffix: IconButton(
              onPressed: () {
                setState(() {
                  if (signUpController.isPasswordVisible == true) {
                    signUpController.isPasswordVisible = false;
                  } else {
                    signUpController.isPasswordVisible = true;
                  }
                });
              },
              icon: Icon(
                FontAwesomeIcons.eye,
                size: 20,
                color: K.tenthColor,
              )),
        ),
        input(
          onChanged: (value) {
            signUpController.confirmPassword = value;
          },
          obscure: signUpController.isPasswordVisible,
          text: 'Confirm Password',
          prefix: Icons.vpn_key_outlined,
          controller: signUpController.personConfirmPasswordController,
          suffix: IconButton(
              onPressed: () {
                setState(() {
                  if (signUpController.isPasswordVisible == true) {
                    signUpController.isPasswordVisible = false;
                  } else {
                    signUpController.isPasswordVisible = true;
                  }
                });
              },
              icon: Icon(
                FontAwesomeIcons.eye,
                size: 20,
                color: K.tenthColor,
              )),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Transform.scale(
                scale: 0.9,
                child: Theme(
                  data: ThemeData(unselectedWidgetColor: K.fourthColor),
                  child: Obx(
                    () => Checkbox(
                      checkColor: K.secondaryColor,
                      focusColor: K.primaryColor,
                      hoverColor: K.secondaryColor,
                      activeColor: K.primaryColor,
                      value: signUpController.isChecked.value,
                      onChanged: (bool? value) {
                        signUpController.isChecked.value = value!;
                      },
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => TermsAndConditions());
              },
              child: Text(
                "I Agree to Terms & Conditions and Privacy Policy",
                style: K.textStyle2.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () => customButton(
              function: signUpController.isChecked.value
                  ? () async {
                      if (signUpController.name == '' ||
                          signUpController.email == '' ||
                          signUpController.phone == '' ||
                          signUpController.password == '') {
                        K.showToast(message: 'Enter all details first');
                      } else if (!signUpController.email.contains('@') ||
                          !signUpController.email.contains('.')) {
                        K.showToast(message: 'Invalid Email');
                      } else if (signUpController.password.length < 8) {
                        K.showToast(
                            message:
                                'Password must be at least 8 characters long');
                      } else if (signUpController.password !=
                          signUpController.confirmPassword) {
                        K.showToast(message: "Passwords don't match");
                      } else {
                        if (!signUpController.isChecked.value) {
                          K.showToast(
                              message: "Accept Terms and conditions please");
                        } else {
                          print(
                              '---------userType------------${signUpController.id}');
                          FirebasePhoneAuth().sendSms(signUpController.phone);
                          Get.to(const VerificationCode());
                        }
                      }
                    }
                  : () {},
              text: 'Sign Up',
              textColor: signUpController.isChecked.value
                  ? K.secondaryColor
                  : Colors.grey,
              arrowColor: signUpController.isChecked.value
                  ? K.secondaryColor
                  : Colors.grey,
              fillColor: signUpController.isChecked.value
                  ? K.primaryColor
                  : Colors.white,
              borderColor: K.primaryColor,
              height: 55.0,
              margin: 10.0),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
