import 'package:date_format/date_format.dart';
import 'package:estibafy_user/Controller/Tab%20Controller/book_helper_data_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final BookHelperDataCollectionController bookHelperCollectionController =
      Get.find(tag: K.bookHelperControllerTag);
  String? _startHour, _startMinute, _startTime;
  String? _endHour, _endMinute, _endTime;

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
                      isEnabled: false,
                      onChanged: (value) {
                        bookHelperCollectionController.startTime = value;
                      },
                      text: 'Time',
                      prefix: Icons.access_time_rounded,
                      prefixColor: K.primaryColor,
                      controller:
                          bookHelperCollectionController.startTimeController,
                      suffix: InkWell(
                        onTap: () {
                          _selectStartTime(context);
                        },
                        //borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
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
              Row(
                children: [
                  Expanded(
                    child: input2(
                      isEnabled: false,
                      // onChanged: (value) {
                      //   bookHelperCollectionController.endTime = value;
                      // },
                      text: 'Time',
                      prefix: Icons.access_time_rounded,
                      prefixColor: K.primaryColor,
                      controller:
                          bookHelperCollectionController.endTimeController,
                      suffix: InkWell(
                        onTap: () {
                          _selectEndTime(context);
                        },
                       // borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
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
        ],
      ),
    );
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        bookHelperCollectionController.selectedStartTime = picked;
        _startHour =
            bookHelperCollectionController.selectedStartTime.hour.toString();
        _startMinute =
            bookHelperCollectionController.selectedStartTime.minute.toString();
        _startTime = _startHour! + ' : ' + _startMinute!;
        // bookHelperCollectionController.startTime = DateFormat("HH:MM").format(DateTime.parse("${_startHour!}:${_startMinute!}"));
        final now = DateTime.now();
        bookHelperCollectionController.startTime = DateFormat("HH:mm:ss")
            .format(DateTime(
                now.year, now.month, now.day, picked.hour, picked.minute));
        // bookHelperCollectionController.startTimeController.text = _startTime!;
        bookHelperCollectionController.startTimeController.text = formatDate(
            DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                bookHelperCollectionController.selectedStartTime.hour,
                bookHelperCollectionController.selectedStartTime.minute),
            [hh, ':', nn, ':', ss, '', am]).toString();
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 1))),
    );
    if (picked != null) {
      setState(
        () {
          bookHelperCollectionController.selectedEndTime = picked;
          _endHour =
              bookHelperCollectionController.selectedEndTime.hour.toString();
          _endMinute =
              bookHelperCollectionController.selectedEndTime.minute.toString();
          _endTime = _endHour! + ' : ' + _endMinute!;
          print("_endTime $_endTime");
          // bookHelperCollectionController.endTime = DateFormat("HH:MM").format(DateTime.parse("${_endHour!}:${_endMinute!}"));

          final now = DateTime.now();
          bookHelperCollectionController.endTime = DateFormat("HH:mm:ss")
              .format(DateTime(
                  now.year, now.month, now.day, picked.hour, picked.minute));
          // bookHelperCollectionController.endTimeController.text = _endTime!;
          bookHelperCollectionController.endTimeController.text = formatDate(
              DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  bookHelperCollectionController.selectedEndTime.hour,
                  bookHelperCollectionController.selectedEndTime.minute),
              [hh, ':', nn, ':', ss, ' ', am]).toString();
          print(
              "TIME ${bookHelperCollectionController.endTimeController.text}");
        },
      );
    }
  }
}
