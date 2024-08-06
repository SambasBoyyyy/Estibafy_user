import 'package:estibafy_user/Controller/Tab%20Controller/book_helper_data_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  // final BookHelperDataCollectionController bookHelperCollectionController = Get.put(BookHelperDataCollectionController());
  final BookHelperDataCollectionController bookHelperCollectionController =
      Get.find(tag: K.bookHelperControllerTag);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookHelperCollectionController.startDateController.text =
        bookHelperCollectionController.startDate;
    bookHelperCollectionController.endDateController.text =
        bookHelperCollectionController.endDate;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Start:',
                  style: K.textStyle2.copyWith(color: K.sixthColor),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: input2(
                      text: 'Date',
                      isEnabled: false,
                      prefix: FontAwesomeIcons.calendarAlt,
                      prefixColor: K.primaryColor,
                      controller:
                          bookHelperCollectionController.startDateController,
                      suffix: InkWell(
                        onTap: () {
                          _startDate(context);
                        },
                        borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
                        child: Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 40,
                          color: K.tenthColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'End:',
                  style: K.textStyle2.copyWith(color: K.sixthColor),
                ),
              ),
              input2(
                isEnabled: false,
                text: "Date",
                prefix: FontAwesomeIcons.calendarAlt,
                prefixColor: K.primaryColor,
                controller: bookHelperCollectionController.endDateController,
                suffix: InkWell(
                  onTap: () {
                    _endDate(context);
                  },
                 borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
                  child: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 40,
                    color: K.tenthColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: K.primaryColor, // header background color
                onPrimary: K.secondaryColor, // header text color
                onSurface: K.primaryColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: K.primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        print(picked);
        bookHelperCollectionController.startDate =
            DateFormat("yyyy-MM-dd").format(picked);
        bookHelperCollectionController.startDateController.text =
            bookHelperCollectionController.startDate;
      });
    }
  }

  Future<void> _endDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: K.primaryColor, // header background color
                onPrimary: K.secondaryColor, // header text color
                onSurface: K.primaryColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: K.primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: DateTime.parse(bookHelperCollectionController.startDate),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.parse(bookHelperCollectionController.startDate),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        print("END ${picked}");
        bookHelperCollectionController.endDate =
            DateFormat("yyyy-MM-dd").format(picked);
        bookHelperCollectionController.endDateController.text =
            bookHelperCollectionController.endDate;
        print(bookHelperCollectionController.endDateController.text);
      });
    }
  }
}
