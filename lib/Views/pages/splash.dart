import 'package:estibafy_user/Views/pages/navigationbar.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../Controller/user_controller.dart';
import '../../models/Classes/user.dart';
import '../Authentication Screens/login_createaccount.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  static Future<bool> readUserData() async {
    UserController _controller = Get.find(tag: K.userControllerTag);

    final data = await K.localStorage.read(_controller.userToken);
    try {
      if (data is User) {
        _controller.user.value = data;
      } else {
        _controller.user.value = User.fromJson(data);
      }
      return true;
    } catch (e) {
      K.showToast(message: 'Error Reading User Data\n$e');
    }
    return false;
  }

  Future<bool> getToken() async {
    final UserController _userController = Get.put(
      UserController(),
      tag: K.userControllerTag,
      permanent: true,
    );

    await Future.delayed(const Duration(seconds: 1));

    String? token = K.localStorage.read(K.loggedInUser) as String?;
    if (token != null) {
      _userController.userToken = token;
      await readUserData();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.dark
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..indicatorType = EasyLoadingIndicatorType.doubleBounce
      ..dismissOnTap = true
      ..maskType = EasyLoadingMaskType.black;

    return FutureBuilder(
      future: getToken(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: SplashScreen());
        } else {
          if (snapshot.data) {
            return const NavBar();
          } else {
            return const LoginOrCreateAccount();
          }
        }
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/estibafyfulllogo.jpeg'),
      ),
    );
    // return Scaffold(
    //   body: AnimatedSplashScreen(
    //       duration: 3000,
    //       splash: 'assets/estibafyfulllogo.jpeg',
    //       splashIconSize: 200,
    //       nextScreen: const LoginOrCreateAccount(),
    //       splashTransition: SplashTransition.scaleTransition,
    //       pageTransitionType: PageTransitionType.scale,
    //       backgroundColor: K.secondaryColor),
    // );
  }
}
