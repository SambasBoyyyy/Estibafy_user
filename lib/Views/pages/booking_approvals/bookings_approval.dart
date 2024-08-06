import 'package:estibafy_user/Views/pages/drawer.dart';
import 'package:estibafy_user/models/Classes/webapis.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../../../models/widgets/approval_jobs_card.dart';

class ApprovalBooking extends StatefulWidget {
  final bool isBackButton;

  const ApprovalBooking({Key? key, required this.isBackButton})
      : super(key: key);

  @override
  State<ApprovalBooking> createState() => _BookingState();
}

class _BookingState extends State<ApprovalBooking>
    with SingleTickerProviderStateMixin {
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
      if (mounted) {
        setState(() {
          data = value;
          isLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isBackButton == false
          ? getAppBar('Post-Payments', _scaffoldKey, actions: [
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
          : getAppBar3('Post-Payments', _scaffoldKey, context),
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
                              : ApprovalJobCard(
                                  data: (data!['data']?['pending'] ?? []) +
                                      (data!['data']?['declined'] ?? []) +
                                      (data!['data']?['inreview'] ?? []),
                                  inProgress: '',
                                  status: cupertinoTabBarIIIValue,
                                )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
