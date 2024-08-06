import 'package:auto_animated/auto_animated.dart';
import 'package:estibafy_user/models/booking_model.dart';
import 'package:flutter/material.dart';

import '../../../Views/pages/bookings/bottom_sheet_widgets/bottom_sheet_widgets.dart';
import '../../../Views/pages/bookings/job_accepted_widget/job_accpted_helper_widget.dart';
import '../../widgets/booking_inprogress_widget.dart';

class BookingInProgress extends StatefulWidget {
  const BookingInProgress({
    Key? key,
    required this.data,
    required this.status,
  }) : super(key: key);

  final List data;
  final int status;

  @override
  State<BookingInProgress> createState() => _BookingInProgressState();
}

class _BookingInProgressState extends State<BookingInProgress>
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

  Widget build(BuildContext context) {
    var listData;
    listData = List<dynamic>.from(
        widget.data.reversed.map((x) => Pending.fromMap(x)).toList());
    return Scaffold(
        body: Stack(
      children: [
        (listData.isNotEmpty)
            ? ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
        widget.data.isEmpty
            ? const SizedBox.shrink()
            : widget.data[0]['status'] == 'complete'
                ? const SizedBox.shrink()
                : DraggableScrollableSheet(
                    initialChildSize: 0.080,
                    minChildSize: 0.080,
                    maxChildSize: 1,
                    snap: true,
                    controller: _controller,
                    snapSizes: const [0.4, 1],
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      Pending pendingJob = listData[0];

                      // if (ifAllHelpersBooked) {
                      //   return Container(
                      //     color: Colors.blueGrey[100],
                      //     child: ListView.builder(
                      //       itemCount: 1,
                      //       itemBuilder: (context, index) {
                      //         double value = scrollController.position.viewportDimension;
                      //         if (value > 200) {
                      //           bottomSheetOpened = !bottomSheetOpened;
                      //           if (bottomSheetOpened) {
                      //             _controller.animateTo(1.0,
                      //                 duration: const Duration(microseconds: 300),
                      //                 curve: Curves.bounceOut);
                      //             Future.delayed(const Duration(microseconds: 500),
                      //                 () => animationController.forward());
                      //           }
                      //         } else {
                      //           animationController.reverse();
                      //         }
                      //         return allHelperAcceptedCard(
                      //             avatarChild: AnimatedCheck(
                      //               progress: _animation,
                      //               size: 100,
                      //               color: Colors.white,
                      //             ),
                      //             onPress: () {
                      //               _controller.animateTo(0.06,
                      //                   duration: const Duration(microseconds: 300),
                      //                   curve: Curves.bounceIn);
                      //               ifAllHelpersBooked = false;
                      //             });
                      //       },
                      //       controller: scrollController,
                      //     ),
                      //   );

                      return Container(
                        color: Colors.blueGrey[100],
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
                                  jobId: '${pendingJob.jobId}',
                                  totalHelpers: '${pendingJob.totalHelpers}',
                                  title: 'Started Helpers');
                            } else if (index.floor().isEven) {
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
                                      helperName: pendingJob
                                          .job!.helpers![index - 1].name,
                                      helperEmail: pendingJob
                                          .job!.helpers![index - 1].email,
                                      helperContact: pendingJob
                                          .job!.helpers![index - 1].mobile,
                                      helperStatus: pendingJob
                                          .job!.jobHelpers![index - 1].status,
                                      color: Colors.brown[50]!,
                                    ),
                                  ));
                            } else {
                              if (pendingJob.job!.helpers != null) {
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
                                        helperName: pendingJob
                                            .job!.helpers![index - 1].name,
                                        helperEmail: pendingJob
                                            .job!.helpers![index - 1].email,
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
                          itemCount: (pendingJob.job!.helpers?.length ?? 0) + 1,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 4.0,
                          ),
                        ),
                      );
                    },
                  )
      ],
    ));
  }
}
