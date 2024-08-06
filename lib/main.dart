import 'dart:io';

import 'package:dismiss_keyboard_on_tap/dismiss_keyboard_on_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estibafy_user/Controller/Setting-Controller/setttings_controller.dart';
import 'package:estibafy_user/models/fcm_notifications.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import 'Views/Authentication Screens/login.dart';
import 'Views/Authentication Screens/login_createaccount.dart';
import 'Views/Authentication Screens/signup.dart';
import 'Views/pages/book_helpers/book_helpers_data_collection.dart';
import 'Views/pages/book_helpers/home.dart';
import 'Views/pages/helpers/helpers.dart';
import 'Views/pages/navigationbar.dart';
import 'Views/pages/paymentmethod/paymentmethods.dart';
import 'Views/pages/sms_verification.dart';
import 'Views/pages/splash.dart';
import 'Views/pages/tracking.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  if (await FCMNotifications.permissionGranted()) {
    FirebaseMessaging.onBackgroundMessage(
        FCMNotifications.firebaseMessagingBackgroundHandler);

    if (Platform.isIOS) {
      await FCMNotifications.handleForegroundIOS();
    } else if (Platform.isAndroid) {
      await FCMNotifications.setupLocalNotifications();
      FirebaseMessaging.onMessage
          .listen(FCMNotifications.handleForegroundNotificationsAndroid);
    }
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: K.primaryColor,
    systemNavigationBarColor: K.primaryColor,
  ));

  if (Platform.isAndroid) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    final SettingsController settingsController = Get.put(SettingsController());
    settingsController.getUserLanguage();
    runApp(EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('es', 'SP')],
        path: 'assets/translations',
        fallbackLocale: settingsController.englishLanguage.value
            ? const Locale('en', 'US')
            : const Locale('en', 'US'),
        child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return DismissKeyboardOnTap(
        child: GetMaterialApp(
          title: 'Estibafy App',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            primaryColor: K.primaryColor,
            textTheme: GoogleFonts.sourceSansProTextTheme(),
          ),
          // localizationsDelegates: const [
          //   location_picker.S.delegate,
          // ],
          initialRoute: '/splash',
          routes: {
            '/loginOrCreateAccount': (context) => const LoginOrCreateAccount(),
            '/splash': (context) => const Splash(),
            '/login': (context) => const Login(),
            '/signUp': (context) => const SignUp(),
            '/verificationCode': (context) => const VerificationCode(),
            '/home': (context) => const Home(),
            '/navBar': (context) => const NavBar(),
            '/bookHelpersDataCollection': (context) =>
                const BookHelpersDataCollection(),
            '/tracking': (context) => Tracking(),
            '/paymentMethods': (context) => PaymentMethods(),
            '/helpersTabBar': (context) => const HelpersTabBar(),
          },
          builder: EasyLoading.init(),
        ),
      );
    });
  }
}
