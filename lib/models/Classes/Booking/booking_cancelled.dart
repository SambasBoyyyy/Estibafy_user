import 'package:estibafy_user/models/Classes/Booking%20Models/booking_cancelled_model.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/booking_cancelled_widget.dart';
import 'package:flutter/material.dart';

class BookingCancelled extends StatelessWidget {
  const BookingCancelled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Text(
              'Nov 7, 2021 @ 8:00 AM',
              style: K.textStyle2,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: BookingsCancelledList.list.length,
            itemBuilder: (BuildContext context, int index) =>
                BuildBookingCancelledCard(
              context: context,
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}
