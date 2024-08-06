import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:estibafy_user/Controller/Authentication%20Screens%20Controllers/signup_controller.dart';
import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/Views/pages/book_helpers/home.dart';
import 'package:estibafy_user/Views/pages/sms_verification.dart';
import 'package:estibafy_user/Views/pages/terms_conditions.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:estibafy_user/models/widgets/pressedwidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Firebase/firebase_phone_auth.dart';

class CompanySignUp extends StatefulWidget {
  const CompanySignUp({Key? key}) : super(key: key);

  @override
  State<CompanySignUp> createState() => _CompanySignUpState();
}

class _CompanySignUpState extends State<CompanySignUp> {
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
            controller: signUpController.companyNameController),
        input(
            text: 'Last Name',
            prefix: Icons.person,
            controller: signUpController.companyLastNameController,
        ),
        input(
            onChanged: (value) {
              signUpController.email = value;
            },
            text: 'Email',
            prefix: Icons.email,
            controller: signUpController.companyEmailController),
        Row(
          children: [
            CountryCodePicker(
              initialSelection: 'ec',
              // showFlag: false,
              onChanged: (value) {
                 countryCode = value.toString();
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
                        signUpController.phone = '${countryCode + signUpController.personMobileController.text}';
                      }
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
        input(
            text: 'Company',
            prefix: Icons.margin,
            controller: signUpController.companyController),
        input(
            text: 'R.U.C',
            prefix: Icons.person_pin_rounded,
            controller: signUpController.companyRUCController),
        input(
            onChanged: (value) {
              signUpController.password = value;
            },
            obscure: signUpController.isPasswordVisible,
            text: 'Password',
            prefix: Icons.vpn_key_outlined,
            controller: signUpController.companyPasswordController,
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
                ))),
        input(
            onChanged: (value) {
              signUpController.confirmPassword = value;
            },
            obscure: signUpController.isPasswordVisible,
            text: 'Confirm Password',
            prefix: Icons.vpn_key_outlined,
            controller: signUpController.companyConfirmPasswordController,
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
                ))),
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
                        ()=> Checkbox(
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
              onTap: (){
                Get.to(()=> TermsAndConditions());
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
        Obx(()=> customButton(
              function:signUpController.isChecked.value ? (){
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
                      message: 'Password must be at least 8 characters long');
                } else if (signUpController.phone.length < 11) {
                  K.showToast(message: 'Invalid Phone number');
                } else {
                  FirebasePhoneAuth().sendSms(signUpController.phone);
                  Get.to(const VerificationCode());
                }
              }:(){},
              // function: () {

              // },
              text: 'Sign Up',
              textColor:signUpController.isChecked.value ? K.secondaryColor : Colors.grey,
              arrowColor:signUpController.isChecked.value? K.secondaryColor : Colors.grey,
              fillColor: signUpController.isChecked.value ? K.primaryColor : Colors.white,
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
