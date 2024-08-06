import 'package:estibafy_user/models/booking_model.dart';
import 'package:estibafy_user/models/widgets/booking_inprogress_widget.dart';
import 'package:flutter/material.dart';

class ApprovalJobCard extends StatefulWidget {
  const ApprovalJobCard(
      {Key? key,
      required this.data,
      required this.status,
      required this.inProgress})
      : super(key: key);

  final List data;
  final String inProgress;
  final int status;

  @override
  State<ApprovalJobCard> createState() => _BookingInProgressState();
}

class _BookingInProgressState extends State<ApprovalJobCard> {
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    var listData;
    if (widget.inProgress == 'in-progress') {
      listData = List<dynamic>.from(
          widget.data.reversed.map((x) => Pending.fromMap(x)).toList());
    } else {
      listData = widget.data.reversed.map((x) => Pending.fromMap(x)).toList();
    }
    return Scaffold(
      body: Stack(
        children: [
          (listData.isNotEmpty)
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  physics: const BouncingScrollPhysics(),
                  itemCount: listData.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (listData[index] != null) {
                      return BuildBookingInProgressCard(
                        context: context,
                        job: listData[index],
                        status: widget.status,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              : const Center(
                  child: Text("There is no job"),
                ),
        ],
      ),
    );
  }
}
