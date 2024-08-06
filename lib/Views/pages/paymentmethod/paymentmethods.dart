
import 'package:estibafy_user/Controller/Drawer%20Controller/payment_Controller.dart';
import 'package:estibafy_user/models/Classes/Payment%20Method%20Widgets/wallet_addbalance_dialog.dart';
import 'package:estibafy_user/models/Classes/Payment%20Method%20Widgets/add_new_card.dart';
import 'package:estibafy_user/models/Classes/Payment%20Method%20Widgets/credit_card.dart';
import 'package:estibafy_user/models/Classes/Payment%20Method%20Widgets/upper_method_box.dart';
import 'package:estibafy_user/models/Classes/Payment%20Method%20Widgets/wallet.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../drawer.dart';

class PaymentMethods extends StatefulWidget {
  PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      appBar: getAppBar2('Payment Methods', _scaffoldKey, context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UpperMethodBox(
                    function: () {
                      setState(() {
                        paymentController.selected.value = 'creditCard';
                      });
                    },
                    center: Icon(
                      FontAwesomeIcons.solidCreditCard,
                      color: paymentController.selected.value == 'creditCard'
                          ? K.secondaryColor
                          : K.primaryColor,
                      size: 30,
                    ),
                    text: 'Credit Card',
                    color: paymentController.selected.value == 'creditCard'
                        ? K.primaryColor
                        : K.secondaryColor,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  UpperMethodBox(
                    function: () {
                      setState(() {
                        paymentController.selected.value = 'wallet';
                      });
                    },
                    center: Icon(
                      FontAwesomeIcons.wallet,
                      color:
                      paymentController.selected.value== 'wallet' ? K.secondaryColor : K.twelveColor,
                      size: 30,
                    ),
                    color: paymentController.selected.value == 'wallet' ? K.primaryColor : K.secondaryColor,
                    text: 'Wallet',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              paymentController.selected.value == 'newCard'
                  ? const AddNewCard()
                  : paymentController.selected.value == 'creditCard'
                      ? const CreditCard()
                      : const Wallet(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: paymentController.selected.value == 'newCard' ||
          paymentController.selected.value == 'creditCard' ||
          paymentController.selected.value== 'wallet'
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: K.secondaryColor, backgroundColor: K.primaryColor,
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius?.circular(5) ?? BorderRadius?.circular(0.0),
                      )),
                  child: Text(
                    'Save',
                    style: K.textStyle3.copyWith(color: K.secondaryColor),
                  ),
                ),
              ),
            )
          : Container(
              height: 55,
            ),
    );
  }
}
