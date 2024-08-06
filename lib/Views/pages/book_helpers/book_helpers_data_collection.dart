import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:estibafy_user/Controller/Tab%20Controller/book_helper_data_controller.dart';
import 'package:estibafy_user/Controller/map_controller.dart';
import 'package:estibafy_user/models/Classes/Data%20Collection%20Widets/cargo_type_boxes.dart';
import 'package:estibafy_user/models/Classes/Data%20Collection%20Widets/date_pickers.dart';
import 'package:estibafy_user/models/Classes/Data%20Collection%20Widets/packaging_type_boxes.dart';
import 'package:estibafy_user/models/Classes/Data%20Collection%20Widets/time_picker.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:estibafy_user/models/widgets/inputwidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/Classes/Data Collection Widets/helper_instruction_box.dart';
import '../drawer.dart';

class BookHelpersDataCollection extends StatefulWidget {
  const BookHelpersDataCollection({Key? key}) : super(key: key);

  @override
  State<BookHelpersDataCollection> createState() =>
      _BookHelpersDataCollectionState();
}

class _BookHelpersDataCollectionState extends State<BookHelpersDataCollection> {
  final BookHelperDataCollectionController bookHelperCollectionController =
      Get.put(BookHelperDataCollectionController(),
          tag: K.bookHelperControllerTag);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  File? _image;
  String paymentMethod = 'Select';

  Future getCameraImage() async {
    final ImagePicker _picker = ImagePicker();
    var image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future getGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  display() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: _image != null
            ? Container(
                child: _image != null
                    ? GestureDetector(
                        onTap: () {
                          selectImageFromCameraOrGallery(context);
                        },
                        child: Image.file(
                          _image!,
                          height: 50.0,
                          width: 50.0,
                        ),
                      )
                    : const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
                  // image:
                ),
              )
            : Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [8, 4],
                    color: K.tenthColor,
                    radius: const Radius.circular(50),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          selectImageFromCameraOrGallery(context);
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: K.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar2('Book Helpers', _scaffoldKey, context),
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            input4(
                text: "Job Name",
                controller: bookHelperCollectionController.jobNameController),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'What type of cargo do you have?',
                        style: K.textStyle3,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        FontAwesomeIcons.truck,
                        color: K.primaryColor,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CargoTypeBoxes(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Visibility(
                          visible: bookHelperCollectionController
                                  .container20feet.value
                              ? true
                              : false,
                          child: Column(
                            children: [
                              Text(
                                "How Many 20feet Containers?",
                                style: K.textStyle3.copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 110,
                                child: DropdownButtonFormField(
                                    alignment: Alignment.center,
                                    itemHeight: 80,
                                    value: 0,
                                    items: const [
                                      DropdownMenuItem(
                                        child: Text("1",
                                            textAlign: TextAlign.center),
                                        value: 0,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("2",
                                            textAlign: TextAlign.center),
                                        value: 1,
                                      )
                                    ],
                                    onChanged: (value) {
                                      bookHelperCollectionController.container
                                          .add(2);
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius?.circular(15.0) ?? BorderRadius?.circular(0.0),
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Obx(
                        () => Visibility(
                          visible: bookHelperCollectionController
                                  .container40feet.value
                              ? true
                              : false,
                          child: Column(
                            children: [
                              Text(
                                "How Many 40feet Containers?",
                                style: K.textStyle3.copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 110,
                                child: DropdownButtonFormField(
                                    alignment: Alignment.center,
                                    itemHeight: 80,
                                    value: 0,
                                    items: const [
                                      DropdownMenuItem(
                                        child: Text("1",
                                            textAlign: TextAlign.center),
                                        value: 0,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("2",
                                            textAlign: TextAlign.center),
                                        value: 1,
                                      )
                                    ],
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                    //  borderRadius: BorderRadius?.circular(15.0) ?? BorderRadius?.circular(0.0),
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'What type of packaging do u need?',
                    style: K.textStyle3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PackagingTypeBoxes(),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    'Add images of Work',
                    style: K.textStyle2.copyWith(fontSize: 10),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    padding: const EdgeInsets.all(6),
                    dashPattern: const [8, 4],
                    color: K.tenthColor,
                    child: display(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Please enter the date and time for the job to be done',
                    style: K.textStyle2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const DatePicker(),
                      SizedBox(
                        height: 140,
                        child: VerticalDivider(
                          color: K.tenthColor,
                        ),
                      ),
                      TimePicker(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Payment Method',
                    style: K.textStyle3,
                  ),
                  DropdownButtonFormField(
                    alignment: Alignment.center,
                    itemHeight: 70,
                    hint: const Text('Select'),
                    items: [
                      DropdownMenuItem(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/logo.png',
                              scale: 25,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Text("Post-paid",
                                textAlign: TextAlign.center),
                          ],
                        ),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Row(
                          children: [
                            Icon(
                              Icons.payment_outlined,
                              color: K.primaryColor,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            const Text("Card", textAlign: TextAlign.center),
                          ],
                        ),
                        value: 1,
                      )
                    ],
                    onChanged: (value) {
                      if (value == 0) {
                        bookHelperCollectionController.paymentMethod.value = 0;
                      } else {
                        bookHelperCollectionController.paymentMethod.value = 1;
                        K.showToast(message: 'Card method not Available..');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Helper Instructions',
                        style:
                            K.textStyle3.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        FontAwesomeIcons.solidCircleQuestion,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const HelperInstructionBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (bookHelperCollectionController
                                .jobNameController.text ==
                            '') {
                          K.showToast(message: 'Please fill job name');
                          return;
                        }
                        if (!(bookHelperCollectionController
                                .container20feet.value ||
                            bookHelperCollectionController
                                .container40feet.value ||
                            bookHelperCollectionController.cargoSuelta.value)) {
                          K.showToast(message: 'Select a Container');
                          return;
                        }

                        if (bookHelperCollectionController.checkedValuesList ==
                                [] ||
                            bookHelperCollectionController
                                .checkedValuesList.isEmpty) {
                          K.showToast(message: 'Select a Packaging');
                          return;
                        }

                        if (bookHelperCollectionController
                                .startDateController.text ==
                            '') {
                          K.showToast(message: 'Start Date is Invalid');
                          return;
                        }

                        if (bookHelperCollectionController
                                .endDateController.text ==
                            '') {
                          K.showToast(message: 'End Date is Invalid');
                          return;
                        }
                        if (bookHelperCollectionController
                                .startTimeController.text ==
                            '') {
                          K.showToast(message: 'Start Time is Invalid');
                          return;
                        }
                        if (bookHelperCollectionController
                                .endTimeController.text ==
                            '') {
                          K.showToast(message: 'End Time is Invalid');
                          return;
                        }

                        if (bookHelperCollectionController
                                .paymentMethod.value ==
                            2) {
                          K.showToast(message: 'Payment Method Invalid');
                          return;
                        }
                        if (bookHelperCollectionController
                                .paymentMethod.value ==
                            1) {
                          K.showToast(
                              message: 'Card method will not available!');
                          return;
                        }

                        MpController mpController = Get.put(MpController());

                        if (mpController.isMapSelected.value) {
                          bookHelperCollectionController.boxes.value = false;
                          bookHelperCollectionController.pallets.value = false;
                          bookHelperCollectionController.sacos.value = false;
                          bookHelperCollectionController.tanks.value = false;
                          bookHelperCollectionController.bidones.value = false;
                          bookHelperCollectionController.others.value = false;
                          bookHelperCollectionController.bookHelper(
                              voicemail: null,
                              jobId: bookHelperCollectionController.jobId,
                              jobName: bookHelperCollectionController
                                  .jobNameController.text,
                              jobAddress:
                                  mpController.pickedUpResult.value.address,
                              containerId:
                                  bookHelperCollectionController.containerId,
                              packageType: bookHelperCollectionController
                                  .checkedValuesList
                                  .join(','),
                              startTime: bookHelperCollectionController
                                      .startDateController.text +
                                  " " +
                                  bookHelperCollectionController
                                      .startTimeController.text,
                              endTime: bookHelperCollectionController
                                      .endDateController.text +
                                  " " +
                                  bookHelperCollectionController
                                      .endTimeController.text,
                              lat: mpController.pickedUpResult.value.latitude
                                  .toString(),
                              lng: mpController.pickedUpResult.value.longitude
                                  .toString(),
                              helperSize:
                                  bookHelperCollectionController.helpers,
                              image: null,
                              paymentMethod:
                                  bookHelperCollectionController.paymentMethod);
                        } else {
                          K.showToast(
                              message: "Please Select location to continue");
                          return;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: K.secondaryColor, backgroundColor: K.primaryColor,
                          shape: const RoundedRectangleBorder(
                           // borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
                          )),
                      child: Text(
                        'Apply',
                        style: K.textStyle3.copyWith(color: K.secondaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectImageFromCameraOrGallery(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                height: 120,
                //decoration: BoxDecoration(
                    //color: K.secondaryColor,
                 //   borderRadius: BorderRadius?.circular(10.0) ?? BorderRadius?.circular(0.0),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: K.eighthColor,
                            child: IconButton(
                                onPressed: () {
                                  getCameraImage();
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.camera,
                                  color: K.secondaryColor,
                                ))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Camera',
                            style: K.textStyle2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: K.primaryColor,
                            child: IconButton(
                                onPressed: () {
                                  getGalleryImage();
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.folder,
                                  color: K.secondaryColor,
                                ))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Gallery',
                            style: K.textStyle2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
