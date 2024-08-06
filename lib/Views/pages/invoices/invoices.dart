import 'package:estibafy_user/Controller/Tab%20Controller/invoice_controller.dart';
import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/Views/pages/invoices/invoices_details.dart';
import 'package:estibafy_user/models/Classes/webapis.dart';
import 'package:estibafy_user/models/invoices_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:estibafy_user/models/widgets/invoices_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../drawer.dart';

class Invoices extends StatelessWidget {
  final bool isBackButton;
  InvoiceController invoiceController = Get.put(InvoiceController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchController = TextEditingController();

  Invoices({Key? key, required this.isBackButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find(tag: K.userControllerTag);
    return Scaffold(
      appBar: isBackButton == false
          ? getAppBar('Invoices', _scaffoldKey)
          : getAppBar2('Invoices', _scaffoldKey, context),
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              // Material(
              //   borderRadius: BorderRadius?.circular(25.0),
              //   elevation: 10.0,
              //   child: Container(
              //     height: 50.0,
              //     child: TextFormField(
              //       controller: searchController,
              //       style: const TextStyle(fontSize: 18.0),
              //       decoration: InputDecoration(
              //           contentPadding: const EdgeInsets.only(
              //               left: 20.0, right: 10.0, bottom: 20.0),
              //           filled: true,
              //           suffixIcon: Row(
              //             mainAxisAlignment:
              //                 MainAxisAlignment.spaceBetween, // added line
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               IconButton(
              //                   onPressed: () {},
              //                   icon: Icon(
              //                     FontAwesomeIcons.solidCalendarCheck,
              //                     color: K.fourthColor,
              //                   )),
              //               SizedBox(
              //                 height: 30,
              //                 child: VerticalDivider(
              //                   color: K.sixthColor,
              //                 ),
              //               ),
              //               IconButton(
              //                   onPressed: () {},
              //                   icon: Icon(
              //                     FontAwesomeIcons.filter,
              //                     color: K.fourthColor,
              //                   )),
              //             ],
              //           ),
              //           prefixIcon: Icon(
              //             FontAwesomeIcons.search,
              //             color: K.primaryColor,
              //           ),
              //           fillColor: Colors.grey[100],
              //           focusedBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius?.circular(25.0),
              //               borderSide: BorderSide.none),
              //           enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius?.circular(25.0),
              //               borderSide: BorderSide.none)),
              //     ),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius?.circular(30),
              //     border: Border.all(color: K.primaryColor, width: 1),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: TextField(
              //             controller: searchController,
              //             decoration: InputDecoration(
              //               prefixIcon: Icon(
              //                 FontAwesomeIcons.search,
              //                 color: K.primaryColor,
              //               ),
              //               border: InputBorder.none,
              //             ),
              //           ),
              //         ),
              //         IconButton(
              //             onPressed: () {},
              //             icon: Icon(
              //               FontAwesomeIcons.solidCalendarCheck,
              //               color: K.fourthColor,
              //             )),
              //         SizedBox(
              //           height: 30,
              //           child: VerticalDivider(
              //             color: K.sixthColor,
              //           ),
              //         ),
              //         IconButton(
              //             onPressed: () {},
              //             icon: Icon(
              //               FontAwesomeIcons.filter,
              //               color: K.fourthColor,
              //             )),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(4.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Jan 1,2021',
              //         style: K.textStyle3.copyWith(color: K.primaryColor),
              //       ),
              //       Text(
              //         '8:00 AM',
              //         style: K.textStyle3.copyWith(color: K.primaryColor),
              //       ),
              //     ],
              //   ),
              // ),
              FutureBuilder<InvoiceModel>(
                  future: WebAPIs.getInvoice(
                      int.parse(_userController.user.value.userId ?? "0")),
                  builder: (context, invoices) {
                    if (invoices.hasData) {
                      if (invoices.data!.data!.isNotEmpty) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: invoices.data!.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return buildInvoicesCard(
                                    context, invoices.data!.data![index], () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => InvoicesDetail(
                                              job: invoices
                                                  .data!.data![index])));
                                });
                              }),
                        );
                      } else {
                        return const Center(
                          child: Text('Empty list'),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
