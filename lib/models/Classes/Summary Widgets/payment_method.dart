import 'package:estibafy_user/Controller/Tab%20Controller/summary_controller.dart';
import 'package:estibafy_user/Views/pages/paymentmethod/paymentmethods.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class PaymentMethodBox extends StatefulWidget {
  const PaymentMethodBox({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethodBox> {
  final SummaryController summaryController =
      Get.find(tag: K.orderSummaryControllerTag);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
        border: Border.all(color: K.fourthColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              leading: const Image(
                image: AssetImage('assets/mc.png'),
                width: 35,
              ),
              title: Text(
                '**********3521',
                style: K.textStyle2,
              ),
              trailing: Transform.scale(
                scale: 0.55,
                child: RoundCheckBox(
                  onTap: (selected) {
                    summaryController.isMasterCard.value = selected!;
                  },
                  isChecked: summaryController.isMasterCard.value,
                  checkedColor: K.primaryColor,
                  borderColor: K.primaryColor,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                FontAwesomeIcons.wallet,
                color: K.twelveColor,
              ),
              title: Text(
                '\$ 500 (Credit)',
                style: K.textStyle2,
              ),
              trailing: Transform.scale(
                scale: 0.55,
                child: RoundCheckBox(
                  onTap: (selected) {
                    summaryController.isCreditCard.value = selected!;
                  },
                  isChecked: summaryController.isCreditCard.value,
                  checkedColor: K.primaryColor,
                  borderColor: K.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 100,
                  child: TextButton(
                      onPressed: () {
                        Get.to(PaymentMethods());
                      },
                      child: Row(
                        children: [
                          Text(
                            'Add',
                            style: K.textStyle3.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            FontAwesomeIcons.plusCircle,
                            color: K.primaryColor,
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
