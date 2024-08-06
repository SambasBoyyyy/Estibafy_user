import 'package:estibafy_user/models/Classes/Booking/upper_container.dart';
import 'package:estibafy_user/models/Classes/job_details_model.dart';
import 'package:estibafy_user/models/Classes/webapis.dart';
import 'package:estibafy_user/models/booking_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:estibafy_user/models/widgets/booking_helpers_widget.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class BookingDetails extends StatelessWidget {
  BookingDetails({Key? key, required this.job, required this.status})
      : super(key: key);
  final Pending job;
  final int status;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar2('Booking', _scaffoldKey, context),
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Job ${job.status == 'inprogress' ? 'In-progress' : job.status}',
                  style: K.textStyle3,
                ),
              ),
              FutureBuilder(
                  future: WebAPIs.getJobDetails(jobId: job.jobId!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var mapData = snapshot.data as Map<String, dynamic>?;
                      if (mapData != null) {
                        var jobModel = JobDetailsModel.fromJson(mapData);
                        return SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: K.tenthColor, width: 0.1),
                            //  borderRadius: BorderRadius?.circular(15) ?? BorderRadius?.circular(0.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UpperContainer(
                                  job: jobModel,
                                  status: status,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 12, bottom: 5),
                                  child: Text(
                                    'Helpers',
                                    style: K.textStyle2,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Divider(),
                                ),
                                jobModel.data!.jobHelpers!.isNotEmpty
                                    ? ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            jobModel.data!.jobHelpers!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                buildBookingHelpersCard(
                                          context,
                                          jobModel.data!.jobHelpers![index],
                                        ),
                                      )
                                    : const SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: Text("No Helper found"),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Expanded(
                            child: Center(
                          child: Text("Failed to load data"),
                        ));
                      }
                    } else {
                      return const Expanded(
                          child: Center(
                        child: CircularProgressIndicator(),
                      ));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
