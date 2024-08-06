import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:estibafy_user/Controller/Authentication%20Screens%20Controllers/login_controlller.dart';
import 'package:estibafy_user/Controller/Authentication%20Screens%20Controllers/signup_controller.dart';
import 'package:estibafy_user/Views/Authentication%20Screens/signup.dart';
import 'package:estibafy_user/models/Classes/Authentication%20Widgets/person_Signup.dart';
import 'package:estibafy_user/models/Classes/Authentication%20Widgets/upper_logo.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:estibafy_user/models/widgets/pressedwidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Controller/user_controller.dart';
import '../../../Views/Authentication Screens/forgot_password_screen.dart';
import 'company_signup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/estibafyfulllogo.jpeg'),
                width: 350,
              ),
              const SizedBox(
                height: 80,
              ),
              input(
                  text: tr('Email'),
                  prefix: Icons.mail,
                  controller: loginController.emailController,
                  onChanged: (value) {
                    loginController.email = value;
                  }),
              input(
                obscure: loginController.isPasswordVisible,
                text: tr('Password'),
                onChanged: (value) {
                  print("password is  " + value);
                  loginController.password = value;
                },
                prefix: Icons.vpn_key_outlined,
                controller: loginController.passwordController,
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        if (loginController.isPasswordVisible == true) {
                          loginController.isPasswordVisible = false;
                        } else {
                          loginController.isPasswordVisible = true;
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
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: () {
                    Get.to(ForgotPassword());
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot password?'),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            customButton(
                function: () {
                  if (loginController.password == '') {
                    K.showToast(message: "Password can't be empty");
                  } else if (EmailValidator.validate(loginController.email) ==
                      false) {
                    K.showToast(message: 'Invalid Email');
                  } else {
                    UserController _controller =
                        Get.find(tag: K.userControllerTag);
                    _controller.signIn(
                      email: loginController.email,
                      password: loginController.password,
                    );
                  }
                },
                text: tr('Log in'),
                textColor: K.secondaryColor,
                arrowColor: K.secondaryColor,
                fillColor: K.primaryColor,
                borderColor: K.primaryColor,
                height: 55.0,
                margin: 10.0),
            const SizedBox(
              height: 13,
            ),
            Container(
              height: 55,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {
                  Get.to(const SignUp());
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
                  side: BorderSide(color: K.primaryColor, width: 0.5),
                )),
                child: Text(
                  'Create Account',
                  style: K.textStyle3.copyWith(
                    color: K.primaryColor,
                  ),
                ).tr(),
              ),
            ),
          ],
        )),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  SignUpController signUpController = Get.put(SignUpController());

  int cupertinoTabBarIIIValueGetter() =>
      signUpController.cupertinoTabBarIIIValue.value;
  final label = ['Person', 'Company'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UpperLogo(),
        const SizedBox(
          height: 20,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  child: Text("Person"),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text("Company"),
                  value: 1,
                )
              ],
              decoration: InputDecoration(
                  label: const Text("Sign Up As"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius?.circular(12.0) ?? BorderRadius?.circular(0.0),
                  )),
              hint: const Text("Person"),
              onChanged: (value) async {
                signUpController.cupertinoTabBarIIIValue.value = value.hashCode;
                signUpController.userType = await value.toString();
              }),
        ),

        ///Code Update 6/25/2022 UI update

        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius?.circular(30),
        //     border: Border.all(color: K.sixthColor, width: 0.5),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(1.0),
        //     child: Align(
        //       alignment: Alignment.topCenter,
        //       child: CupertinoTabBar.CupertinoTabBar(
        //         Colors.transparent,
        //         K.primaryColor,
        //         [
        //           // PersonOrCompanyButton(onPressed: (value){
        //           //   return signUpController.userType = value;
        //           // }, text: "Person", valueInt: 0),
        //           Text(
        //             label[0],
        //             style: K.textStyle3.copyWith(
        //                 color:
        //                     signUpController.cupertinoTabBarIIIValue.value == 0
        //                         ? K.secondaryColor
        //                         : K.primaryColor),
        //             textAlign: TextAlign.center,
        //           ),
        //           Text(
        //             label[1],
        //             style: K.textStyle3.copyWith(
        //                 color:
        //                     signUpController.cupertinoTabBarIIIValue.value == 1
        //                         ? K.secondaryColor
        //                         : K.primaryColor),
        //             textAlign: TextAlign.center,
        //           ),
        //           // PersonOrCompanyButton(onPressed: (value){
        //           //   return signUpController.userType = value;
        //           // }, text: "Company", valueInt: 1)
        //         ],
        //         cupertinoTabBarIIIValueGetter,
        //         (int index) {
        //           setState(() {
        //             signUpController.userType = index.toString();
        //
        //             signUpController.cupertinoTabBarIIIValue.value = index;
        //           });
        //         },
        //         useShadow: false,
        //         allowExpand: true,
        //         useSeparators: false,
        //         innerVerticalPadding: 14,
        //         innerHorizontalPadding: 15,
        //         outerHorizontalPadding: 15,
        //         outerVerticalPadding: 12,
        //         borderRadius: BorderRadius?.circular(30),
        //       ),
        //     ),
        //   ),
        // ),

        const SizedBox(height: 20),
        Obx(
          () => Container(
              child: signUpController.cupertinoTabBarIIIValue.value == 0
                  ? const PersonSignUp()
                  : const CompanySignUp()),
        ),
      ],
    );
  }
}
