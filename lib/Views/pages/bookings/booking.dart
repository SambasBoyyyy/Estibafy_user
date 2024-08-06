import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:estibafy_user/Views/pages/drawer.dart';
import 'package:estibafy_user/models/Classes/Booking/booking_inprogress.dart';
import 'package:estibafy_user/models/Classes/webapis.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../../../models/Classes/Booking/booking_schedule.dart';

class Booking extends StatefulWidget {
  final bool isBackButton;

  const Booking({Key? key, required this.isBackButton}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int cupertinoTabBarIIIValue = 0;
  int cupertinoTabBarIIIValueGetter() => cupertinoTabBarIIIValue;
  bool isLoaded = false;
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    getJobs();
  }

  getJobs() async {
    if (isLoaded) {
      setState(() {
        data = null;
        isLoaded = false;
      });
    }

    WebAPIs.getJobs().then((value) {
      setState(() {
        data = value;
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isBackButton == false
          ? getAppBar('Booking', _scaffoldKey, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: K.secondaryColor,
            radius: 18,
            child: IconButton(
                onPressed: () {
                  getJobs();
                },
                icon: Icon(
                  Icons.refresh,
                  color: K.darkBlue,
                  size: 20,
                )),
          ),
        ),
      ])
          : AppBar(
        backgroundColor: K.primaryColor,
        elevation: 0.0,
        toolbarHeight: 70,
        centerTitle: true,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: K.secondaryColor,
              radius: 18,
              child: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: K.darkBlue,
                    size: 18,
                  )),
            ),
          ),
        ),
        title: Text(
          'Booking',
          style: K.textStyle2
              .copyWith(fontSize: 18, color: K.secondaryColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: K.secondaryColor,
              radius: 18,
              child: IconButton(
                  onPressed: () {
                    getJobs();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: K.darkBlue,
                    size: 20,
                  )),
            ),
          ),
        ],
      ),
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius?.circular(30) ?? BorderRadius?.circular(0.0),
                      border: Border.all(color: K.sixthColor, width: 0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CupertinoTabBar.CupertinoTabBar(
                          Colors.transparent,
                          K.primaryColor,
                          [
                            Text(
                              "In Review",
                              style: K.textStyle2.copyWith(
                                  color: cupertinoTabBarIIIValue == 0
                                      ? K.secondaryColor
                                      : K.ninthColor),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Pending",
                              style: K.textStyle2.copyWith(
                                  color: cupertinoTabBarIIIValue == 1
                                      ? K.secondaryColor
                                      : K.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "In Progress",
                              style: K.textStyle2.copyWith(
                                  color: cupertinoTabBarIIIValue == 2
                                      ? K.secondaryColor
                                      : K.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Completed",
                              style: K.textStyle2.copyWith(color: K.fifthColor),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Cancelled",
                              style:
                              K.textStyle2.copyWith(color: K.thirteenColor),
                              textAlign: TextAlign.center,
                            ),
                          ],
                          cupertinoTabBarIIIValueGetter,
                              (int index) {
                            setState(() {
                              cupertinoTabBarIIIValue = index;
                            });
                          },
                          useShadow: false,
                          allowExpand: true,
                          useSeparators: false,
                          innerVerticalPadding: 14,
                          innerHorizontalPadding: 15,
                          outerHorizontalPadding: 15,
                          outerVerticalPadding: 12,
                          borderRadius: BorderRadius?.circular(20) ?? BorderRadius?.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Job Schedule',
                    style: K.textStyle3.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    child: !isLoaded
                        ? const Center(child: CircularProgressIndicator())
                        : data == null
                        ? const Center(child: Text('No Jobs Found'))
                        : cupertinoTabBarIIIValue == 0
                        ? BookingInProgress(
                      data: data!['data']?['inreview'] ?? [],
                      status: cupertinoTabBarIIIValue,
                    )
                        : cupertinoTabBarIIIValue == 1
                        ? PendingBooking(
                      data: data!['data']['pending'],
                      inProgress: '',
                      status: cupertinoTabBarIIIValue,
                    )
                        : cupertinoTabBarIIIValue == 2
                        ? BookingInProgress(
                      data: data!['data']?['inprogress'] ?? [],
                      status: cupertinoTabBarIIIValue,
                    )
                        : cupertinoTabBarIIIValue == 3
                        ? BookingInProgress(
                      data: data!['data']['complete'] ?? [],
                      status: cupertinoTabBarIIIValue,
                    )
                        : BookingInProgress(
                      data: data!['data']['canceled'] ?? [],
                      status: cupertinoTabBarIIIValue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


