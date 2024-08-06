import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/models/Classes/job_details_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({Key? key, required this.job, required this.status})
      : super(key: key);
  final JobDetailsModel job;
  final int status;

  @override
  Widget build(BuildContext context) {
    final UserController _controller = Get.find(tag: K.userControllerTag);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: K.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: K.secondaryColor,
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                    image: AssetImage('assets/logo.png'),
                                    fit: BoxFit.contain)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            _controller.user.value.name,
                            style:
                                K.textStyle2.copyWith(color: K.secondaryColor),
                          ),
                          Text(
                            'Comandato',
                            style:
                                K.textStyle2.copyWith(color: K.secondaryColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            job.data!.name!,
                            style:
                                K.textStyle2.copyWith(color: K.secondaryColor),
                          ),
                          Text(
                            job.data!.packageType!,
                            style:
                                K.textStyle2.copyWith(color: K.secondaryColor),
                          ),
                          Text(
                            'Total: \$${((double.parse(job.data!.checkout!.baseFare!) * job.data!.checkout!.totalHelpers!) + double.parse(job.data!.checkout!.taxRate!)).toStringAsFixed(2)}',
                            style: K.textStyle3.copyWith(color: K.ninthColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        // pushNewScreenWithRouteSettings(
                        //   context,
                        //   settings: const RouteSettings(name: '/tracking'),
                        //   screen: Tracking(),
                        //   withNavBar: true,
                        // );
                        // pushNewScreenWithRouteSettings(
                        //   context,
                        //   settings:
                        //       const RouteSettings(name: '/invoicesDetail'),
                        //   //screen: InvoicesDetail(job: job),
                        //   withNavBar: true,
                        // );
                      },
                      icon: InkWell(
                        onTap: () {
                          Get.showSnackbar(const GetSnackBar(
                            dismissDirection: DismissDirection.startToEnd,
                            duration: Duration(seconds: 2),
                            icon: Icon(Icons.info_outline_rounded, color: Colors.white,),
                            message: 'Map tracking available soon..!',
                          ));
                        },
                        child: Icon(
                          FontAwesomeIcons.solidMap,
                          color: K.secondaryColor,
                        ),
                      ))
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                job.data!.checkout!.status! == 'completed' ? check() : circle(),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.data!.checkout!.status! == 'inprogress'
                          ? 'In-progress'
                          : job.data!.checkout!.status!,
                      style: K.textStyle2.copyWith(color: K.secondaryColor),
                    ),
                    Text(
                      'Your Order is ${job.data!.checkout!.status} by ${job.data!.checkout!.totalHelpers} Helpers',
                      style: K.textStyle2.copyWith(color: K.secondaryColor),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                job.data!.checkout!.status! == 'completed' ? check() : circle(),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.data!.checkout!.status! == 'inprogress'
                          ? 'In-progress'
                          : job.data!.checkout!.status! + ' Status',
                      // 'Waiting for start confirmation',
                      style: K.textStyle2.copyWith(color: K.secondaryColor),
                    ),
                    Text(
                      DateFormat.yMMMd().format(job.data!.createdAt!),
                      style: K.textStyle2.copyWith(color: K.secondaryColor),
                    ),
                    Text(
                      'Start @${DateFormat('kk:mm a').format(job.data!.startTime!)}  End @${DateFormat('kk:mm a').format(job.data!.endTime!)}',
                      style: K.textStyle2.copyWith(color: K.secondaryColor),
                    ),
                  ],
                ),
              ],
            ),
            // if (status > 0)
            //   const SizedBox(
            //     height: 15,
            //   ),
            // if (status > 0)
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       check(),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Job Starting',
            //             style: K.textStyle2.copyWith(color: K.secondaryColor),
            //           ),
            //           Text(
            //             'Dec 25, 2021',
            //             style: K.textStyle2.copyWith(color: K.secondaryColor),
            //           ),
            //           Text(
            //             '8:50 AM',
            //             style: K.textStyle2.copyWith(color: K.secondaryColor),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // if (status > 1)
            //   const SizedBox(
            //     height: 15,
            //   ),
            // if (status > 1)
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       check(),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       Text(
            //         'In Progress',
            //         style: K.textStyle2.copyWith(color: K.secondaryColor),
            //       ),
            //     ],
            //   ),
            // if (status > 2)
            //   const SizedBox(
            //     height: 15,
            //   ),
            // if (status > 2)
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       check(),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       Text(
            //         'Completed',
            //         style: K.textStyle2.copyWith(color: K.secondaryColor),
            //       ),
            //     ],
            //   ),
            // const SizedBox(
            //   height: 15,
            // ),
          ],
        ),
      ),
    );
  }

  circle() {
    return Container(
      height: 13,
      width: 13,
      margin: const EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 10),
          shape: BoxShape.circle),
    );
  }

  check() {
    return Row(
      children: [
        Container(
          height: 13,
          width: 13,
          margin: const EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
              border: Border.all(color: K.secondaryColor, width: 5),
              shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 8,
        ),
        Icon(
          FontAwesomeIcons.check,
          color: K.ninthColor,
          size: 16,
        ),
      ],
    );
  }
}
