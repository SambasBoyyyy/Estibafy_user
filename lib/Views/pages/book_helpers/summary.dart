import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:estibafy_user/models/widgets/pressedwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Controller/Tab Controller/book_helper_data_controller.dart';
import '../../../Controller/Tab Controller/summary_controller.dart';
import '../drawer.dart';
import 'finding_helpers.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key, required this.response, required this.helperCount})
      : super(key: key);

  final int helperCount;
  final Map<String, dynamic> response;

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final BookHelperDataCollectionController bookHelperCollectionController =
      Get.put(BookHelperDataCollectionController(),
          tag: K.bookHelperControllerTag);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SummaryController summaryController =
      Get.put(SummaryController(), tag: K.orderSummaryControllerTag);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tax_12_PR =
        ((widget.response['base_fare'] * widget.helperCount) / 100) * 12;
    var base_fare = widget.response['base_fare'];
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      appBar: getAppBar2('Summary', _scaffoldKey, context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/svg/truck_icon.svg',
                    width: 40,
                    color: K.primaryColor,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Text(
                          'Job Address',
                          style: K.textStyle3.copyWith(
                              fontWeight: FontWeight.bold,
                              color: K.primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Divider(
                          color: K.tenthColor,
                          thickness: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: K.primaryColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.response['job_detail']['address'],
                    style: K.textStyle2,
                  ),
                ),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 50,
                ),
                Text(
                  'Date & Time',
                  style: K.textStyle3,
                ),
                IconButton(
                    onPressed: () {},
                    icon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          color: K.primaryColor,
                        ))),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.calendarAlt,
                        size: 20,
                        color: K.primaryColor,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start:',
                              style: K.textStyle2,
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(DateTime.parse(
                                  widget.response['job_detail']['start_time'])),
                              style: K.textStyle2,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'End:',
                              style: K.textStyle2,
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(DateTime.parse(
                                  widget.response['job_detail']['end_time'])),
                              style: K.textStyle2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: VerticalDivider(
                    color: K.tenthColor,
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.clock,
                        size: 20,
                        color: K.primaryColor,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start:',
                              style: K.textStyle2,
                            ),
                            Text(
                              DateFormat('kk:mm a').format(DateTime.parse(
                                  widget.response['job_detail']['start_time'])),
                              style: K.textStyle2,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'End:',
                              style: K.textStyle2,
                            ),
                            Text(
                              DateFormat('kk:mm a').format(DateTime.parse(
                                  widget.response['job_detail']['end_time'])),
                              style: K.textStyle2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.boxOpen,
                      size: 20,
                      color: K.primaryColor,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Packing :',
                      style: K.textStyle3,
                    ),
                  ],
                ),
                Text(
                  widget.response['job_detail']['package_type'],
                  style: K.textStyle3,
                ),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.toolbox,
                        size: 20,
                        color: K.primaryColor,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Container Size:',
                        style: K.textStyle3,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    bookHelperCollectionController.container.join(','),
                    style: K.textStyle3,
                  ),
                ),
              ],
            ),
            divider(),
            Text(
              'CHARGES',
              style: K.textStyle3
                  .copyWith(fontWeight: FontWeight.bold, color: K.primaryColor),
            ),
            const SizedBox(
              height: 6,
            ),
            Card(
              color: K.primaryColor,
              shape: RoundedRectangleBorder(
           //     borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Base Fare', style: K.textStyle4),
                        Text("\$" + base_fare.toString(), style: K.textStyle4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Helpers', style: K.textStyle4),
                        Text(widget.helperCount.toString(),
                            style: K.textStyle4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('SUB-TOTAL', style: K.textStyle4),
                        Text("\$" + (base_fare * widget.helperCount).toString(),
                            style: K.textStyle4),
                      ],
                    ),
                    Divider(
                      color: K.tenthColor,
                      thickness: 0.3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax (12%)', style: K.textStyle4),
                        Text("\$${tax_12_PR.toStringAsFixed(2)} ",
                            // widget.response['checkout_detail']['tax']
                            //     .toString(),
                            style: K.textStyle4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TOTAL', style: K.textStyle4),
                        Text(
                            "\$" +
                                ((base_fare * widget.helperCount) + tax_12_PR)
                                    .toString(),
                            style: K.textStyle4),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Row(
            //   children: [
            //     Icon(
            //       FontAwesomeIcons.solidCreditCard,
            //       color: K.primaryColor,
            //       size: 20,
            //     ),
            //     const SizedBox(
            //       width: 12,
            //     ),
            //     Text(
            //       'PAYMENT METHOD',
            //       style: K.textStyle3,
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 18,
            // ),
            // const PaymentMethodBox(),
            const SizedBox(
              height: 40,
            ),
            customButton3(
              function: () async {
                int? result = await summaryController.jobCheckout(
                  data: widget.response,
                  paymentMethod:
                      bookHelperCollectionController.paymentMethod.value,
                  helperCount: widget.helperCount,
                );
                if (result != null) {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: '/findingHelpers'),
                    screen: FindingHelpers(orderID: widget.response['job_id']),
                    withNavBar: true,
                  );
                } else {
                  K.showToast(message: 'Failed to post job.');
                }
              },
              text: 'Book Helpers',
              borderColor: K.primaryColor,
              textColor: K.secondaryColor,
              iconColor: K.secondaryColor,
              fillColor: K.primaryColor,
              margin: 10.0,
              height: 50.0,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: K.tenthColor,
        thickness: 0.2,
      ),
    );
  }
}
