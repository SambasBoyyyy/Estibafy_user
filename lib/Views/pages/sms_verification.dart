import 'dart:async';

import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/models/Classes/Firebase/firebase_phone_auth.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Controller/Authentication Screens Controllers/signup_controller.dart';

class VerificationCode extends StatefulWidget {
  final String? mobileNo;
  const VerificationCode({Key? key, this.mobileNo}) : super(key: key);

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  TextEditingController textEditingController = TextEditingController();
  SignUpController signUpController = Get.put(SignUpController());

  int secondsRemaining = 60;
  bool enableResend = true;
  Timer? timer;

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();

    timer = Timer.periodic(const Duration(seconds: 100), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // String strDigits(int n) => n.toString().padLeft(2, '0');
    // final seconds = strDigits(duration.inSeconds.remainder(60));
    // print('=-==========${seconds}');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: K.secondaryColor,
      body: SizedBox(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'SMS Verification Code',
                  style: K.textStyle1.copyWith(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text('Please type verification code sent to',
                    style: K.textStyle2),
              ),
              Center(
                child: Text(signUpController.phone, style: K.textStyle3),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: K.textStyle3,
                  length: 6,
                  obscureText: false,
                  obscuringCharacter: '•',
                  textStyle: K.textStyle3,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 5) {
                      return null;
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                   // borderRadius: BorderRadius?.circular(12) ?? BorderRadius?.circular(0.0),
                    borderWidth: 1,
                    fieldWidth: 50,
                    activeFillColor: Colors.transparent,
                    inactiveColor: K.tertiaryColor,
                    inactiveFillColor: Colors.transparent,
                    selectedColor: K.tertiaryColor,
                    disabledColor: K.fourthColor,
                  ),
                  cursorColor: K.tertiaryColor,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: false,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) async {
                    var location = await UserController.getUserLocation();
                    print('Phone Auth Started----------------------------');
                    FirebasePhoneAuth().verifyPhone(v).then((value) {
                      if (value) {
                        UserController _controller =
                            Get.find(tag: K.userControllerTag);
                        _controller.signUp(
                            userType: signUpController.userType,
                            id: signUpController.id,
                            name: signUpController.name,
                            email: signUpController.email,
                            phone: signUpController.phone,
                            password: signUpController.password,
                            confirmPassword: signUpController.confirmPassword,
                            lat: location?.latitude ?? 0.60000,
                            lng: location?.longitude ?? 0.50000);
                      }
                    });

                    print("Completed");
                  },
                  onTap: () {
                    if (kDebugMode) {
                      print("Pressed");
                    }
                  },
                  onChanged: (value) {
                    if (kDebugMode) {
                      print(value);
                    }
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    if (kDebugMode) {
                      print("Allowing to paste $text");
                    }
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I didn’t receive a code! ",
                    style: K.textStyle2.copyWith(color: K.tenthColor),
                  ),
                  enableResend
                      ? InkWell(
                          onTap: () {
                            FirebasePhoneAuth()
                                .sendSms(signUpController.phone)
                                .then((value) {
                              if (value) {
                                K.showToast(
                                    message: 'OTP resent to your phone');
                              }
                            });
                          },
                         // borderRadius: BorderRadius?.circular(10) ?? BorderRadius?.circular(0.0),
                          child: Text(
                            "resend otp",
                            style:
                                K.textStyle2.copyWith(color: K.tertiaryColor),
                          ),
                        )
                      : InkWell(
                          onTap: () {},
                       //   borderRadius: BorderRadius?.circular(10) ?? BorderRadius?.circular(0.0),
                          child: Text(
                            "after $secondsRemaining seconds",
                            style:
                                K.textStyle2.copyWith(color: K.tertiaryColor),
                          ),
                        ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     FontAwesomeIcons.arrowCircleRight,
                  //     size: 26,
                  //   ),
                  //   color: K.fourthColor,
                  // ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
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
