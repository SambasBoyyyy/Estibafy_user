import 'package:easy_localization/easy_localization.dart';
import 'package:estibafy_user/Controller/Setting-Controller/setttings_controller.dart';
import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/utils/constants.dart';
import '../../../models/widgets/appbar.dart';
import 'language_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar2('Settings', _scaffoldKey, context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(const LanguageScreen());
              },
              child: Material(
               borderRadius: BorderRadius?.circular(15.0) ?? BorderRadius?.circular(0.0),
                elevation: 5.0,
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: K.secondaryColor,
                       borderRadius: BorderRadius?.circular(15.0) ?? BorderRadius?.circular(0.0),),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Change Language",
                            style: K.textStyle1,
                          ).tr(),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    )),
              ),
            ),
            Spacer(),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                showAlertDialog(context);
              },
              child: const Text(
                'Delete Account',
                style: TextStyle(color: Colors.white),
              ).tr(),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        UserController controller = UserController();
        controller.deleteAccount();
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirmation"),
      content: const Text("Are you sure to delete your account?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
