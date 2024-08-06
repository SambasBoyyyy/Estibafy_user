import 'package:estibafy_user/models/booking_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controller/user_controller.dart';

class BuildBookingInProgressCard extends StatefulWidget {
  final BuildContext context;
  final Pending job;
  final int status;

  const BuildBookingInProgressCard({
    Key? key,
    required this.context,
    required this.job,
    required this.status,
  }) : super(key: key);

  @override
  _BuildBookingInProgressCardState createState() =>
      _BuildBookingInProgressCardState();
}

class _BuildBookingInProgressCardState
    extends State<BuildBookingInProgressCard> {
  bool isExpanded = false;
  final GlobalKey<ExpansionTileCardState> jobCard = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find(tag: K.userControllerTag);
    return buildBookingInProgress(
        widget.context, widget.job, _userController.user.value.paymentDays);
  }

  buildBookingInProgress(BuildContext context, Pending job, int? paymentDays) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        // borderRadius: BorderRadius?.circular(10) ?? BorderRadius?.circular(0.0),
        elevation: 5.0,
        shadowColor: K.primaryColor,
        child: Container(
          // decoration: BoxDecoration(
          //     border: Border.all(color: const Color(0xFFC2C2C2)),
          //     borderRadius: BorderRadius?.circular(10) ?? BorderRadius?.circular(0.0),
          //     color: K.secondaryColor),
          child: Column(
            children: [
              ExpansionTileCard(
                finalPadding: EdgeInsets.zero,
                animateTrailing: true,
                key: jobCard,
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order # ${job.jobId}',
                          style: K.textStyle5.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          widget.job.status == "inreview"
                              ? "(in-review)"
                              : widget.job.status == "declined"
                                  ? "(declined)"
                                  : widget.job.status == "complete"
                                      ? ""
                                      : widget.job.status == "inprocess"
                                          ? ''
                                          : widget.job.status == "pending"
                                              ? '(accepted)'
                                              : '',
                          style: TextStyle(
                            color: widget.job.status == "inreview"
                                ? Colors.orangeAccent
                                : widget.job.status == "declined"
                                    ? Colors.red
                                    : widget.job.status == "complete"
                                        ? Colors.green
                                        : Colors.green,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesomeIcons.fileInvoice,
                            color: K.fourthColor,
                            size: 26,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: Text(
                              '${job.job!.address}',
                              textAlign: TextAlign.center,
                              //job.job!.address.toString(),
                              style:
                                  K.textStyle2.copyWith(color: K.fourthColor),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 0.5,
                            width: 25,
                          ),
                          Text(
                            // '\$ ${((double.parse(job.baseFare!) * job.totalHelpers!) + double.parse(job.taxRate!)).toStringAsFixed(2)}',
                            '\$ ${(double.parse(job.total!)).toStringAsFixed(2)}',
                            style: K.textStyle1.copyWith(
                                color: K.fourthColor,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
                children: <Widget>[
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        reusableJobItem(
                            title: 'Helpers',
                            icon: FontAwesomeIcons.solidHandshake,
                            detail: '${job.totalHelpers}',
                            textStyle:
                                K.textStyle1.copyWith(color: K.fourthColor),
                            cardWidth: MediaQuery.of(context).size.width * 0.3),
                        const SizedBox(
                          width: 8.0,
                        ),
                        reusableJobItem(
                            title: 'Job Type',
                            icon: FontAwesomeIcons.boxesStacked,
                            detail: '${job.job!.container!.name} (1)',
                            textStyle:
                                K.textStyle2.copyWith(color: K.fourthColor),
                            cardWidth:
                                MediaQuery.of(context).size.width * 0.55),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        reusableJobItem(
                            title: 'Payment Method',
                            icon: Icons.payment_outlined,
                            detail: 'Post-pay',
                            textStyle:
                                K.textStyle2.copyWith(color: K.fourthColor),
                            cardWidth: MediaQuery.of(context).size.width * 0.3),
                        const SizedBox(
                          width: 8.0,
                        ),
                        reusableJobItem(
                            title: 'Package Type',
                            icon: CupertinoIcons.cube_box,
                            detail: '${job.job!.packageType}',
                            textStyle:
                                K.textStyle2.copyWith(color: K.fourthColor),
                            cardWidth:
                                MediaQuery.of(context).size.width * 0.55),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Schedule',
                            style: K.textStyle2,
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Material(
                            elevation: 3.0,
                            // borderRadius: BorderRadius?.circular(10.0) ?? BorderRadius?.circular(0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              padding: const EdgeInsets.all(10.0),
                              // decoration: BoxDecoration(
                              //   color: K.secondaryColor,
                              //   borderRadius: BorderRadius?.circular(15.0) ?? BorderRadius?.circular(0.0),
                              // ),
                              child: Row(
                                children: [
                                  Icon(
                                    (CupertinoIcons.calendar),
                                    color: K.primaryColor,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Start:   ' +
                                              DateFormat(
                                                      'dd-MM-yyyy @' 'kk:mm a')
                                                  .format(job.job!.endTime!),
                                          style: K.textStyle2.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 6.0,
                                        ),
                                        Text(
                                          'End:   ' +
                                              DateFormat(
                                                      'dd-MM-yyyy  @' 'kk:mm a')
                                                  .format(job.job!.startTime!),
                                          style: K.textStyle2.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Post-Payment Days: $paymentDays",
                        style: K.textStyle2.copyWith(color: K.tertiaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reusableJobItem(
      {required String title,
      required IconData icon,
      required String detail,
      required TextStyle textStyle,
      required double cardWidth}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: K.textStyle2,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Material(
          elevation: 3.0,
          // borderRadius: BorderRadius?.circular(10.0) ?? BorderRadius?.circular(0.0),
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.all(10.0),
            // decoration: BoxDecoration(
            //   color: K.secondaryColor,
            //   borderRadius: BorderRadius?.circular(15.0) ?? BorderRadius?.circular(0.0),
            // ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: K.primaryColor,
                ),
                Flexible(
                  child: Center(
                    child: Text(
                      detail,
                      textAlign: TextAlign.center,
                      //job.job!.address.toString(),
                      style: textStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
