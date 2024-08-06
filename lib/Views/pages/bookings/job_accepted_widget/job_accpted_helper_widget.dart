import 'package:flutter/material.dart';

class JobAcceptedHelpersWidget extends StatelessWidget {
  const JobAcceptedHelpersWidget(
      {Key? key,
      required this.helperImage,
      required this.helperName,
      required this.helperEmail,
      required this.color,
      required this.helperStatus,
      required this.helperContact})
      : super(key: key);

  final String? helperImage;
  final String? helperName;
  final String? helperEmail;
  final String? helperStatus;
  final Color color;
  final String? helperContact;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage(helperImage!),
            backgroundColor: helperImage == '' ? Colors.grey : Colors.white,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(helperName!),
              const SizedBox(
                height: 2.0,
              ),
              Text(helperEmail!),
              const SizedBox(
                height: 2.0,
              ),
              Text(helperContact!)
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('status'),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                helperStatus! == 'accepted'
                    ? 'Accepted'
                    : helperStatus! == 'completed'
                        ? 'Completed'
                        : 'Started',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: helperStatus! == 'accepted'
                        ? Colors.lightBlue
                        : helperStatus! == 'completed'
                            ? Colors.teal
                            : Colors.green[400]),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.check_circle,
            size: 30.0,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
