import 'package:estibafy_user/Views/pages/bookings/helper_profile.dart';
import 'package:estibafy_user/models/Classes/job_details_model.dart';
import 'package:estibafy_user/models/Repositories/booking_repo.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

Widget buildBookingHelpersCard(BuildContext context, JobHelper helper) {
  // final data = BookingsHelpersList.list[index % 2];
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius?.circular(12) ?? BorderRadius?.circular(0.0),
      side: BorderSide(color: K.tenthColor, width: 0.2),
    ),
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 7),
    child: InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
          context,
          settings: const RouteSettings(name: '/helperProfile'),
          screen: HelperProfile(
            profile: helper.helperProfile!,
            // imagePath: helper.helperProfile!.image,
            // email: helper.helperProfile!.email,
            // phone: helper.helperProfile!.mobile,
            // ID: helper.helperProfile!.govermentId,
            // rating: 15
          ),
          withNavBar: true,
        );
      },
      borderRadius: BorderRadius?.circular(12) ?? BorderRadius?.circular(0.0),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 15, bottom: 10, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: K.fourthColor,
                    backgroundImage:
                        NetworkImage(helper.helperProfile!.imagePath!),
                    radius: 23,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.star,
                //       color: K.ninthColor,
                //       size: 16,
                //     ),
                //     const SizedBox(
                //       width: 1.5,
                //     ),
                //     Text(
                //       "4.8",
                //       style: K.textStyle5,
                //     ),
                //     const SizedBox(
                //       width: 8,
                //     ),
                //   ],
                // ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: K.primaryColor,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      helper.helperProfile!.email!,
                      style: K.textStyle5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: K.primaryColor,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(helper.helperProfile!.mobile!, style: K.textStyle5),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.person_pin_rounded,
                //       color: K.primaryColor,
                //       size: 18,
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     Text("${helper.helperProfile!.govermentId}", style: K.textStyle5),
                //   ],
                // ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(child: Container()),
            SizedBox(
              height: 70,
              child: VerticalDivider(
                color: K.tenthColor,
              ),
            ),
            Expanded(child: Container()),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    BookingRepo.openDialer(
                        number: helper.helperProfile!.mobile!.toString());
                  },
                  icon: Icon(
                    Icons.phone,
                    color: K.fifthColor,
                    size: 22,
                  ),
                ),
                Text(
                  'Call',
                  style: K.textStyle5,
                ),
              ],
            ),
            // Column(
            //   children: [
            //     IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         Icons.chat_bubble_outline,
            //         color: K.twelveColor,
            //         size: 22,
            //       ),
            //     ),
            //     Text(
            //       'Chat',
            //       style: K.textStyle5,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    ),
  );
}
