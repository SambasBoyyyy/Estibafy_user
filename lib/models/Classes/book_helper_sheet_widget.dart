import 'package:estibafy_user/Controller/Tab%20Controller/book_helper_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BookHelperSheetWidget extends StatefulWidget {
  const BookHelperSheetWidget({Key? key, required this.suggestedHelpers})
      : super(key: key);

  final String suggestedHelpers;

  @override
  State<BookHelperSheetWidget> createState() => _BookHelperSheetWidgetState();
}

class _BookHelperSheetWidgetState extends State<BookHelperSheetWidget> {
  final BookHelperController bookHelperController =
      Get.find(tag: K.bookHelperControllerTag);

  @override
  void initState() {
    super.initState();

    int suggestedHelpers = 1;
    try {
      suggestedHelpers = int.parse(widget.suggestedHelpers);
    } catch (e) {}

    bookHelperController.helpersNo = suggestedHelpers;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                if (bookHelperController.helpersNo == 1) {
                  bookHelperController.helpersNo = 1;
                } else {
                  bookHelperController.helpersNo--;
                }
              });
            },
            icon: Icon(
              FontAwesomeIcons.minusCircle,
              color: K.primaryColor,
              size: 26,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            bookHelperController.helpersNo.toString(),
            style: K.textStyle1.copyWith(color: K.primaryColor, fontSize: 22),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                bookHelperController.helpersNo++;
              });
            },
            icon: Icon(
              FontAwesomeIcons.plusCircle,
              color: K.primaryColor,
              size: 26,
            )),
      ],
    );
  }
}
