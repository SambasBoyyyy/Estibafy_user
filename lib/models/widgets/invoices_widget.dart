import 'package:estibafy_user/models/invoices_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildInvoicesCard(BuildContext context, Datum data, Function() onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius?.circular(18) ?? BorderRadius?.circular(0.0),
        ),
        elevation: 5,
        shadowColor: K.primaryColor,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 15, bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //Get.to(Profile());
                        },
                        child: CircleAvatar(
                          backgroundColor: K.fourthColor,
                          backgroundImage: NetworkImage(
                              data.job!.jobHelpers![0].helperProfile?.image ??
                                  ""),
                          radius: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons.star,
                      //       color: K.ninthColor,
                      //       size: 16,
                      //     ),
                      //     const SizedBox(
                      //       width: 1.5,
                      //     ),
                      //     // Text(
                      //     //   data.rating.toString(),
                      //     //   style: K.textStyle2,
                      //     // ),
                      //     const SizedBox(
                      //       width: 8,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 70,
                    child: VerticalDivider(
                      color: K.tenthColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Job Id # ${data.jobId}',
                        style: K.textStyle3
                            .copyWith(fontSize: 17, color: K.primaryColor),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: K.primaryColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                              data.job!.jobHelpers![0].helperProfile?.email ??
                                  "",
                              style: K.textStyle2),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: K.primaryColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                              data.job!.jobHelpers![0].helperProfile?.mobile ??
                                  "",
                              style: K.textStyle2),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          // Icon(
                          //   Icons.person_pin_rounded,
                          //   color: K.primaryColor,
                          //   size: 20,
                          // ),
                          const SizedBox(
                            width: 5,
                          ),
                          // Text("${data.}", style: K.textStyle2),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  FontAwesomeIcons.arrowCircleRight,
                  color: K.primaryColor,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
