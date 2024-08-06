import 'package:estibafy_user/Controller/Tab%20Controller/book_helper_data_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class CargoTypeBoxes extends StatelessWidget {
  CargoTypeBoxes({Key? key}) : super(key: key);
  final BookHelperDataCollectionController bookHelperCollectionController =
      Get.find(tag: K.bookHelperControllerTag);

  @override
  Widget build(BuildContext context) {
    void selectedContainers(String value) {
      int index = bookHelperCollectionController.container.indexOf(value);

      if (index < 0) {
        bookHelperCollectionController.container.add(value);
      } else {
        bookHelperCollectionController.container.removeAt(index);
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: K.primaryColor, width: 0.8),
        //borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
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
                          bookHelperCollectionController.container20feet.value =
                              selected!;
                          selectedContainers('Container 20 Feet');
                        },
                        checkedColor: K.primaryColor,
                        borderColor: K.primaryColor,
                      ),
                    ),
                    Text(
                      'Container 20 Feet',
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
                          bookHelperCollectionController.cargoSuelta.value =
                              selected!;
                          selectedContainers('Carga Suelta');
                        },
                        checkedColor: K.primaryColor,
                        borderColor: K.primaryColor,
                      ),
                    ),
                    Text(
                      'Carga Suelta',
                      style: K.textStyle2,
                    ),
                  ],
                )),
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 0.55,
                  child: RoundCheckBox(
                    onTap: (selected) {
                      bookHelperCollectionController.container40feet.value =
                          selected!;
                      selectedContainers('Container 40 Feet');
                    },
                    checkedColor: K.primaryColor,
                    borderColor: K.primaryColor,
                  ),
                ),
                Text(
                  'Container 40 Feet',
                  style: K.textStyle2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
