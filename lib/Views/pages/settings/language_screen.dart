import 'package:easy_localization/easy_localization.dart';
import 'package:estibafy_user/Controller/Setting-Controller/setttings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/utils/constants.dart';
import '../../../models/widgets/appbar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  void initState() {
    super.initState();
    _settingsController.getUserLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar2('Language', _scaffoldKey, context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Choose Language',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
              ).tr(),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Material(
             borderRadius: BorderRadius?.circular(15.0)  ?? BorderRadius?.circular(0.0),
              elevation: 5.0,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: K.secondaryColor,
                   borderRadius: BorderRadius?.circular(15.0) ?? BorderRadius?.circular(0.0),),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'English',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ).tr(),
                        const Spacer(),
                        Obx(
                          () => Radio(
                            value: _settingsController.englishLanguage.value,
                            onChanged: (value) async {
                              _settingsController.updateUserLanguage(
                                  context, 'English');
                            },
                            groupValue: true,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'Spanish',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ).tr(),
                        const Spacer(),
                        Obx(
                          () => Radio(
                            value: _settingsController.spanishLanguage.value,
                            onChanged: (value) async {
                              _settingsController.updateUserLanguage(
                                  context, 'Spanish');
                            },
                            groupValue: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
