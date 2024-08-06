import 'package:estibafy_user/models/Example%20Object/example_objects.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

walletAddBalanceDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      String? priceChoose;
      var width = MediaQuery.of(context).size.width;
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius?.circular(25) ?? BorderRadius?.circular(0.0),
            side:  BorderSide(color: K.primaryColor, width: 2)),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: 400,
                width: width,
                decoration: BoxDecoration(
                  color: K.secondaryColor,
                  borderRadius: BorderRadius?.circular(5.0) ?? BorderRadius?.circular(0.0),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(FontAwesomeIcons.timesCircle)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Icon(
                        FontAwesomeIcons.moneyBillWave,
                        color: K.fourthColor,
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Add Balance To Wallet',
                        style:K.textStyle2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius?.circular(12) ?? BorderRadius?.circular(0.0),
                          border: Border.all(color: K.tenthColor),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownButton(
                          value: priceChoose,
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Center(
                                child: Text('\$00.00', style: K.textStyle2)),
                          ),
                          iconSize: 30,
                          isExpanded: true,
                          underline: Container(
                            height: 0,
                            color: Colors.deepPurpleAccent,
                          ),
                          icon:  Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.expand_more,
                              color: K.primaryColor,
                              size: 24,
                            ),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              priceChoose = newValue;
                            });
                          },
                          items: ExampleObjects.priceChoose.map((valueItems) {
                            return DropdownMenuItem<String>(
                              value:valueItems,
                              child: Center(
                                child: Text(
                                  '\$ $valueItems',
                                  style: K.textStyle2,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Add Custom Amount Balance To Wallet',
                        style: K.textStyle2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius?.circular(12) ?? BorderRadius?.circular(0.0),
                          border: Border.all(color:K. tenthColor),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Custom Amount',
                            hintStyle: K.textStyle2.copyWith(
                                color: K.tenthColor, fontSize: 11),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 55,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: K.secondaryColor, backgroundColor: K.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius?.circular(1) ?? BorderRadius?.circular(0.0),
                              )),
                          child: Text(
                            'Add Balance',
                            style: K.textStyle3.copyWith(color: K.secondaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      );
    },
  );
}
