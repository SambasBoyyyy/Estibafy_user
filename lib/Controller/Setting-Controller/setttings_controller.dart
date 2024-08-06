import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  Rx<String> userLanguage = 'English'.obs;
  Rx<bool> englishLanguage = true.obs;
  Rx<bool> spanishLanguage = false.obs;

  updateUserLanguage(BuildContext context, String language) async {
    SharedPreferences setLanguage = await SharedPreferences.getInstance();
    if (language == 'English') {
      englishLanguage.value = true;
      spanishLanguage.value = false;
      context.resetLocale();
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      englishLanguage.value = false;
      spanishLanguage.value = true;
      const _newLocale = Locale('es', 'SP');
      context.setLocale(_newLocale);
      Get.updateLocale(_newLocale);
    }
    userLanguage.value = language;
    setLanguage.setString('language', language);
  }

  getUserLanguage() async {
    SharedPreferences getLanguage = await SharedPreferences.getInstance();
    final language = getLanguage.getString('language');
    if (language == 'English') {
      englishLanguage.value = true;
      spanishLanguage.value = false;
    } else {
      englishLanguage.value = false;
      spanishLanguage.value = true;
    }
  }
}
