

import 'package:estibafy_user/Controller/Drawer%20Controller/payment_Controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
             // borderRadius: BorderRadius?.circular(12) ?? BorderRadius?.circular(0.0),
              border: Border.all(color: K.tenthColor.withOpacity(0.4)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      FontAwesomeIcons.solidCreditCard,
                      size: 20,
                      color: K.primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Visa',
                        style: K.textStyle2,
                      ),
                      Text(
                        '**********5678',
                        style: K.textStyle2,
                      ),
                    ],
                  ),
                  Text(
                    '12/24',
                    style: K.textStyle2,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline_sharp,
                        color: K.tenthColor,
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      setState(() {
                        paymentController.selected.value= 'newCard';
                      });
                    });
                  },
                  icon: const Icon(FontAwesomeIcons.plusCircle)),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Add Card',
                style: K.textStyle2,
              ),
            ],
          ),
        ],
      );
    }
}
