
import 'package:estibafy_user/Controller/Tab%20Controller/tracking_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'drawer.dart';

class Tracking extends StatelessWidget {
  Tracking({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

TrackingController trackingController = Get.put(TrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:K. secondaryColor,
      drawer: const SideDrawer(),
      appBar: getAppBar2('Tracking', _scaffoldKey, context),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/mapestibafy.png'),
              fit: BoxFit.fill,
            )),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 20,
            child: Card(
              shape: RoundedRectangleBorder(
               // borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    children: [
                       Icon(
                        FontAwesomeIcons.stopwatch,
                        color:K. fourthColor,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Start',
                              style: K.textStyle5.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '8:20 AM',
                              style: K.textStyle5.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Timer',
                              style: K.textStyle5.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            CountdownTimer(
                              endTime: trackingController.endTime,
                              widgetBuilder: (_, CurrentRemainingTime? time) {
                                if (time == null) {
                                  return Text(
                                    'Time over',
                                    style: K.textStyle5.copyWith(
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                                return Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${time.hours} : ',
                                        style: K.textStyle2.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${time.min} : ',
                                        style: K.textStyle2.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${time.sec}',
                                        style: K.textStyle2.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: VerticalDivider(
                          color: K.sixthColor,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'End',
                              style: K.textStyle5.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '5:30 PM',
                              style:K. textStyle5.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
