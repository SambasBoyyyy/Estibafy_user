import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentController extends GetxController{
  final TextEditingController nameController = TextEditingController();

  final TextEditingController cardNoController = TextEditingController();

  final TextEditingController expiresDateController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();
  DateTime? expiresDate = DateTime.now();
  RxBool isChecked = true.obs;
  RxString selected = 'newCard'.obs;


  Future<void> _expiresDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: K.fourteenColor,
                onPrimary: K.secondaryColor,
                onSurface: K.fourteenColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: K.tenthColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate:  expiresDate!,
        initialDatePickerMode: DatePickerMode.year,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
      expiresDate = picked;
       expiresDateController.text = DateFormat.yM().format(expiresDate!);
      });
    }
  }

  void setState(Null Function() param0) {}

}