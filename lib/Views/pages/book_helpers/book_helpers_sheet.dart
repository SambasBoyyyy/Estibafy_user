import 'package:estibafy_user/Views/pages/book_helpers/summary.dart';
import 'package:estibafy_user/models/Classes/book_helper_sheet_widget.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/pressedwidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Controller/Tab Controller/book_helper_controller.dart';

class BookHelperSheet extends StatefulWidget {
  const BookHelperSheet({Key? key, required this.response}) : super(key: key);

  final Map<String, dynamic> response;

  @override
  _BookHelperSheetState createState() => _BookHelperSheetState();
}

class _BookHelperSheetState extends State<BookHelperSheet> {
  final BookHelperController bookHelperController =
      Get.put(BookHelperController(), tag: K.bookHelperControllerTag);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: K.secondaryColor,
      child: Column(
        children: [
          SizedBox(
              width: 90,
              child: Divider(
                color: K.sixthColor,
                thickness: 2,
              )),
          const SizedBox(
            height: 40,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.solidHandshake,
                    color: K.primaryColor,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text('How Many Helpers the you are looking ?',
                      style: K.textStyle2),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
               //   borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
                  //color: secondaryColor,
                  border: Border.all(color: K.primaryColor),
                ),
                child: BookHelperSheetWidget(
                    suggestedHelpers:
                        widget.response['suggest_helper'].toString()),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                  'System will suggest you helpers according to Your requirement',
                  style: K.textStyle2.copyWith(fontSize: 11)),
              const SizedBox(
                height: 40,
              ),
              customButton2(
                  function: () {
                    // Use this suggested helpers in next screen
                    Navigator.pop(context);

                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: Summary(
                        helperCount: bookHelperController.helpersNo,
                        response: widget.response,
                      ),
                      withNavBar: true,
                    );
                  },
                  text: 'Next',
                  borderColor: K.primaryColor,
                  textColor: K.secondaryColor,
                  arrowColor: K.secondaryColor,
                  fillColor: K.primaryColor,
                  margin: 20.0,
                  height: 50.0),
            ],
          ),
        ],
      ),
    );
  }
}
