import 'package:estibafy_user/models/Classes/Booking%20Models/booking_schedule_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BuildBookingScheduleCard extends StatefulWidget {
  final BuildContext context;
  final int index;

  const BuildBookingScheduleCard({
    Key? key,
    required this.context,
    required this.index,
  }) : super(key: key);

  @override
  _BuildBookingScheduleCardState createState() =>
      _BuildBookingScheduleCardState();
}

class _BuildBookingScheduleCardState extends State<BuildBookingScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return buildBookingSchedule(widget.context, widget.index);
  }

  buildBookingSchedule(BuildContext context, int index) {
    final data = BookingsScheduleList.list[index];
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0), color: K.primaryColor),
          child: ExpansionTile(
            iconColor: K.secondaryColor,
            collapsedIconColor: K.secondaryColor,
            title: Column(
              children: [
                Text(
                  'Order # ${data.orderNumber}',
                  style: K.textStyle4.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: K.secondaryColor,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('Address',
                                  style: K.textStyle2
                                      .copyWith(color: K.secondaryColor)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data.address,
                            style:
                                K.textStyle2.copyWith(color: K.secondaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.calendarAlt,
                                color: K.secondaryColor,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('Schedule',
                                  style: K.textStyle2
                                      .copyWith(color: K.secondaryColor)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'Start:',
                                style: K.textStyle2
                                    .copyWith(color: K.secondaryColor),
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
                                    color: K.secondaryColor,
                                  ),
                                  child: Center(
                                      child: Text(
                                    '${data.startDate} ${data.startTime}',
                                    style: K.textStyle2.copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                'End:',
                                style: K.textStyle2
                                    .copyWith(color: K.secondaryColor),
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
                                    color: K.secondaryColor,
                                  ),
                                  child: Center(
                                      child: Text(
                                    '${data.endDate} ${data.endTime}',
                                    style: K.textStyle2.copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 160,
                        child: VerticalDivider(
                          color: K.tenthColor,
                        )),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidHandshake,
                                color: K.secondaryColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Helpers',
                                style: K.textStyle2
                                    .copyWith(color: K.secondaryColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: CircleAvatar(
                                backgroundColor: K.twelveColor,
                                child: Text(
                                  data.helpers,
                                  style: K.textStyle1.copyWith(
                                      color: K.secondaryColor,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidMap,
                                color: K.secondaryColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Tracking',
                                style: K.textStyle2
                                    .copyWith(color: K.secondaryColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: '/bookingDetails'),
                                screen: const SizedBox(), //BookingDetails(),
                                withNavBar: true,
                              );
                            },
                            child: Container(
                              height: 28,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
                                color: K.secondaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Track',
                                    style: K.textStyle2,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: K.twelveColor,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: K.secondaryColor,
                                      size: 12,
                                    ),
                                    radius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Icon(
                        FontAwesomeIcons.boxOpen,
                        color: K.secondaryColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Packing:',
                              style: K.textStyle4,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              data.packing,
                              style: K.textStyle4,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Container Size:',
                              style: K.textStyle4,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              data.containerSize,
                              style: K.textStyle4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      'TOTAL',
                      style: K.textStyle3.copyWith(color: K.secondaryColor),
                    ),
                    const Spacer(),
                    Text(
                      '\$ ${data.totalPrice}',
                      style: K.textStyle2.copyWith(
                          color: K.secondaryColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
