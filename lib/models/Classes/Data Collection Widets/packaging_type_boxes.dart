import 'package:estibafy_user/Controller/Tab%20Controller/book_helper_data_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class PackagingTypeBoxes extends StatelessWidget {
  PackagingTypeBoxes({Key? key}) : super(key: key);
  final BookHelperDataCollectionController bookHelperCollectionController =
      Get.find(tag: K.bookHelperControllerTag);

  void checkboxValues(String value) {
    int index = bookHelperCollectionController.checkedValuesList.indexOf(value);

    if (index < 0) {
      bookHelperCollectionController.checkedValuesList.add(value);
    } else {
      bookHelperCollectionController.checkedValuesList.removeAt(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: K.primaryColor, width: 0.8),
        borderRadius:   BorderRadius?.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.55,
                      child: RoundCheckBox(
                        onTap: (selected) {
                          bookHelperCollectionController.boxes.value =
                              selected!;
                          checkboxValues("Boxes");
                        },
                        checkedColor: K.primaryColor,
                        borderColor: K.primaryColor,
                      ),
                    ),
                    Text(
                      'Boxes',
                      style: K.textStyle2,
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.55,
                      child: RoundCheckBox(
                        onTap: (selected) {
                          bookHelperCollectionController.pallets.value =
                              selected!;
                          checkboxValues("Pallets");
                        },
                        checkedColor: K.primaryColor,
                        borderColor: K.primaryColor,
                      ),
                    ),
                    Text(
                      'Pallets',
                      style: K.textStyle2,
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.55,
                      child: RoundCheckBox(
                        onTap: (selected) {
                          bookHelperCollectionController.sacos.value =
                              selected!;
                          checkboxValues("Sacos");
                        },
                        checkedColor: K.primaryColor,
                        borderColor: K.primaryColor,
                      ),
                    ),
                    Text(
                      'Sacos',
                      style: K.textStyle2,
                    ),
                  ],
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.55,
                      child: RoundCheckBox(
                        onTap: (selected) {
                          bookHelperCollectionController.tanks.value =
                              selected!;
                          checkboxValues("Tanks");
                        },
                        checkedColor: K.primaryColor,
                        borderColor: K.primaryColor,
                      ),
                    ),
                    Text(
                      'Tanks',
                      style: K.textStyle2,
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.55,
                      child: RoundCheckBox(
                        onTap: (selected) {
                          bookHelperCollectionController.bidones.value =
                              selected!;
                          checkboxValues("Bidones");
                        },
                        checkedColor: K.primaryColor,
                        borderColor: K.primaryColor,
                      ),
                    ),
                    Text(
                      'Bidones',
                      style: K.textStyle2,
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.55,
                      child: RoundCheckBox(
                        onTap: (selected) {
                          bookHelperCollectionController.others.value =
                              selected!;
                          checkboxValues("Others");
                        },
                        checkedColor: K.primaryColor,
                        borderColor: K.primaryColor,
                      ),
                    ),
                    Text(
                      'Others',
                      style: K.textStyle2,
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
