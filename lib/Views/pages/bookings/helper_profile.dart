
import 'package:estibafy_user/models/Classes/Helper%20Profile/call_button.dart';
import 'package:estibafy_user/models/Classes/Helper%20Profile/message_button.dart';
import 'package:estibafy_user/models/Classes/job_details_model.dart';
import 'package:estibafy_user/models/Repositories/booking_repo.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../drawer.dart';

class HelperProfile extends StatelessWidget {
  // final String imagePath, email, phone, ID;
  // final double rating;
  final HelperrProfile profile;
  HelperProfile(
      {Key? key,
      // required this.imagePath,
      // required this.email,
      // required this.phone,
      // required this.ID,
      // required this.rating
      required this.profile
      })
      : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:K. secondaryColor,
      drawer: const SideDrawer(),
      appBar: getAppBar2('Helper Profile', _scaffoldKey, context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
               // borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
                border: Border.all(color: K.sixthColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
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
                                backgroundColor:K. fourthColor,
                                backgroundImage: NetworkImage("${profile.image}"),
                                radius: 38,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            // Row(
                            //   children: [
                            //      Icon(
                            //       Icons.star,
                            //       color: K.ninthColor,
                            //       size: 18,
                            //     ),
                            //     const SizedBox(
                            //       width: 1.5,
                            //     ),
                            //     Text(
                            //       "4.8",
                            //       style: K.textStyle3,
                            //     ),
                            //     const SizedBox(
                            //       width: 8,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, bottom: 12),
                              child: Text(
                                '${profile.name}',
                                style: K.textStyle1,
                              ),
                            ),
                            (profile.isVerified == 1)
                                ?Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.checkCircle,
                                  color: K.fifthColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Verified',
                                  style: K.textStyle3,
                                ),
                              ],
                            ):const Text(
                              'Verification Pending',
                              style: TextStyle(color: Colors.red),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                 Icon(
                                  Icons.email,
                                  color: K.primaryColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${profile.email}",
                                  style: K.textStyle3,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                 Icon(
                                  Icons.phone,
                                  color: K.primaryColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text("${profile.mobile}", style:K. textStyle3),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.person_pin_rounded,
                            //       color: K.primaryColor,
                            //       size: 20,
                            //     ),
                            //     const SizedBox(
                            //       width: 8,
                            //     ),
                            //     Text("${profile.govermentId}", style: K.textStyle3),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                    divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Icon(
                          Icons.location_on,
                          color: K.primaryColor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            "${profile.apartment??''} ${profile.city??''} ${profile.province??''} ${profile.country}",
                            style: K.textStyle3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    divider(),
                    CallButton(function:(){
                      BookingRepo.openDialer(number: profile.mobile!);
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    // MessageButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  divider() {
    return  Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
      child: Divider(
        color: K.tenthColor,
      ),
    );
  }
}
