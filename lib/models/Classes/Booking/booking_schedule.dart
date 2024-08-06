import 'package:animated_check/animated_check.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:estibafy_user/Views/pages/bookings/bottom_sheet_widgets/bottom_sheet_widgets.dart';
import 'package:estibafy_user/models/booking_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../Views/pages/bookings/job_accepted_widget/job_accpted_helper_widget.dart';
import '../../widgets/booking_inprogress_widget.dart';

class PendingBooking extends StatefulWidget {
  const PendingBooking(
      {Key? key,
      required this.data,
      required this.status,
      required this.inProgress})
      : super(key: key);

  final List data;
  final String inProgress;
  final int status;

  @override
  State<PendingBooking> createState() => _BookingInProgressState();
}

class _BookingInProgressState extends State<PendingBooking>
    with SingleTickerProviderStateMixin {
  bool ifAllHelpersBooked = false;
  bool bottomSheetOpened = false;

  late AnimationController animationController;
  late Animation<double> _animation;

  final DraggableScrollableController _controller =
      DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCirc));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    _controller.dispose();
  }

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
          DraggableScrollableSheet(
            initialChildSize: 0.080,
            minChildSize: 0.080,
            maxChildSize: 1,
            snap: true,
            controller: _controller,
            snapSizes: const [0.4, 1],
            builder: (BuildContext context, ScrollController scrollController) {
              Pending pendingJob = Pending();
              if (listData.isNotEmpty) {
                pendingJob = listData[0];
              }
              if (pendingJob.job != null) {
                if (pendingJob.job!.helpers != null) {
                  if (pendingJob.totalHelpers ==
                      pendingJob.job!.helpers?.length) {
                    ifAllHelpersBooked = true;
                  }
                }
              }
              if (ifAllHelpersBooked) {
                return Container(
                  decoration: BoxDecoration(
                      color: K.primaryColor,
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10.0))),
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      double value =
                          scrollController.position.viewportDimension;
                      if (value > 200) {
                        bottomSheetOpened = !bottomSheetOpened;
                        if (bottomSheetOpened) {
                          _controller.animateTo(1.0,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.bounceOut);
                          Future.delayed(const Duration(microseconds: 500),
                              () => animationController.forward());
                        }
                      } else {
                        animationController.reverse();
                      }
                      return allHelperAcceptedCard(
                          avatarChild: AnimatedCheck(
                            progress: _animation,
                            size: 100,
                            color: Colors.white,
                          ),
                          onPress: () {
                            _controller.animateTo(0.06,
                                duration: const Duration(microseconds: 300),
                                curve: Curves.bounceIn);
                            ifAllHelpersBooked = false;
                          });
                    },
                    controller: scrollController,
                  ),
                );
              } else {
                return Container(
                  // decoration: BoxDecoration(
                  //     color: K.primaryColor,
                     // borderRadius: BorderRadius?.circular(8.0) ?? BorderRadius?.circular(0.0),),
                  child: LiveGrid.options(
                    controller: scrollController,
                    options: const LiveOptions(
                      delay: Duration(milliseconds: 100),
                      showItemInterval: Duration(milliseconds: 100),
                      showItemDuration: Duration(milliseconds: 200),
                      visibleFraction: 0.05,
                      reAnimateOnVisibility: true,
                    ),
                    itemBuilder: (context, index, animation) {
                      if (index == 0) {
                        return bottomSheetHeader(
                            jobId: pendingJob.jobId != null
                                ? '${pendingJob.jobId}'
                                : '0',
                            totalHelpers: pendingJob.totalHelpers != null
                                ? '${pendingJob.totalHelpers}'
                                : "0",
                            title: 'Confirmed Helpers');
                      } else if (index.floor().isEven) {
                        if (pendingJob.job!.helpers!.isNotEmpty) {
                          return FadeTransition(
                              opacity: Tween<double>(
                                begin: 0,
                                end: 1,
                              ).animate(animation),
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.1),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: JobAcceptedHelpersWidget(
                                  helperImage: 'assets/logo.png',
                                  helperName:
                                      pendingJob.job!.helpers![index - 1].name,
                                  helperEmail:
                                      pendingJob.job!.helpers![index - 1].email,
                                  helperContact: pendingJob
                                      .job!.helpers![index - 1].mobile,
                                  helperStatus: pendingJob
                                      .job!.jobHelpers![index - 1].status,
                                  color: Colors.brown[50]!,
                                ),
                              ));
                        } else {
                          return Center(
                            child: const Text(
                              'This Job is not Accepted \n by any helper yet!',
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                      } else {
                        if (pendingJob.job!.helpers!.isNotEmpty) {
                          return FadeTransition(
                              opacity: Tween<double>(
                                begin: 0,
                                end: 1,
                              ).animate(animation),
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.1),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: JobAcceptedHelpersWidget(
                                  helperImage: 'assets/logo.png',
                                  helperName:
                                      pendingJob.job!.helpers![index - 1].name,
                                  helperEmail:
                                      pendingJob.job!.helpers![index - 1].email,
                                  helperContact: pendingJob
                                      .job!.helpers![index - 1].mobile,
                                  helperStatus: pendingJob
                                      .job!.jobHelpers![index - 1].status,
                                  color: Colors.grey[50]!,
                                ),
                              ));
                        } else {
                          return Center(
                            child: const Text(
                              'This Job is not Accepted \n by any helper yet!',
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                      }
                    },
                    itemCount: (pendingJob.job?.helpers?.length ?? 0) + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 4.0,
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
