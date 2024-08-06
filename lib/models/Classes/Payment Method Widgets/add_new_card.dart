

import 'package:estibafy_user/Controller/Drawer%20Controller/payment_Controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  PaymentController paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
                'Add New Card or Scan',
                style: K.textStyle3,
              )),
          const SizedBox(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              'Name',
              style: K.textStyle2,
            ),
          ),
          input3(text: 'Name', controller: paymentController.nameController),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              'Card Number',
              style: K.textStyle2,
            ),
          ),
          input3(
              text: 'Card Number',
              controller:  paymentController.cardNoController,
              suffix: const Image(
                image: AssetImage('assets/mc.png'),
                width: 30,
              )),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Expires',
                        style: K.textStyle2,
                      ),
                    ),
                    Stack(
                      children: [
                        input3(
                          text: '00/0000',
                          controller: paymentController. expiresDateController,
                        ),
                        Positioned(
                          right: 5,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                              onPressed: () {
                                showMonthPicker(
                                  context: context,
                                  initialDate:  paymentController.expiresDate ?? DateTime.now(),
                                ).then((date) {
                                  if (date != null) {
                                    setState(() {
                                      paymentController.expiresDate = date;
                                      paymentController.expiresDateController.text =
                                          DateFormat.yM().format( paymentController.expiresDate!);
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.calendarAlt,
                                color: K.secondaryColor.withOpacity(0.8),
                                size: 20,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'CVV',
                        style: K.textStyle2,
                      ),
                    ),
                    input3(
                      text: '000',
                      controller:  paymentController.cvvController,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Transform.scale(
                    scale: 0.9,
                    child: Theme(
                      data: ThemeData(unselectedWidgetColor: K.tenthColor),
                      child: Checkbox(
                        checkColor: K.secondaryColor,
                        focusColor: K.tenthColor,
                        hoverColor: K.secondaryColor,
                        activeColor: K.tenthColor,
                        value:  paymentController.isChecked.value,
                        onChanged: (bool? value) {
                          setState(() {
                            paymentController.isChecked.value = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Text(
                  "Securely save card and details",
                  style: K.textStyle2.copyWith(color: K.tenthColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    }



  }
