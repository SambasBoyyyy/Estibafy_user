import 'package:flutter/material.dart';

import '../../../../models/utils/constants.dart';

Widget allHelperAcceptedCard(
    {required Widget avatarChild, required Function() onPress}) {
  return Column(
    children: [
      SizedBox(
        height: 8.0,
      ),
      Center(
        child: Container(
          width: 80.0,
          height: 3.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 40.0,
      ),
      CircleAvatar(
        backgroundColor: Colors.green,
        radius: 50,
        child: avatarChild,
      ),
      const SizedBox(
        height: 50.0,
      ),
      const Text(
        'CONGRATULATIONS!',
        style: TextStyle(fontSize: 18.0, color: Colors.green),
      ),
      const SizedBox(
        height: 15.0,
      ),
      const Text(
        'All helpers has been Confirmed',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      const SizedBox(
        height: 40.0,
      ),
      MaterialButton(
          child: Text(
            'Done',
            style: TextStyle(
              color: K.secondaryColor,
            ),
          ),
          minWidth: 100.0,
          color: K.primaryColor,
          onPressed: onPress)
    ],
  );
}

Widget bottomSheetHeader(
    {required String jobId,
    required String totalHelpers,
    required String title}) {
  return Container(
    height: 90.0,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        color: Colors.white,
        border: Border.all(color: K.primaryColor, width: 1.5)),
    child: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Container(
            width: 80.0,
            height: 3.0,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w900, color: Colors.grey),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
              child: Text(
                'Order # $jobId',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Number of Helpers Required',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  totalHelpers,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
