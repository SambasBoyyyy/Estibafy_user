import 'package:easy_localization/easy_localization.dart';
import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/Views/pages/bookings/booking.dart';
import 'package:estibafy_user/Views/pages/profile/profile.dart';
import 'package:estibafy_user/Views/pages/settings/settings_screen.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Bindings/bindings.dart';
import 'booking_approvals/bookings_approval.dart';
import 'invoices/invoices.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  late UserController userController;

  @override
  void initState() {
    super.initState();
    print('calling drawer');
    userController = Get.find(tag: K.userControllerTag);
    print("${userController.user.value.name}");
  }

  @override
  Widget build(BuildContext context) {
    // Read user data from GetStorage
    final userData = K.localStorage.read(K.userControllerTag);
    final userName = userData != null ? userData['name'] : 'Guest';
    final userEmail = userData != null ? userData['email'] : 'guest@example.com';

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Drawer(
            child: Container(
              color: K.secondaryColor,
              child: Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 2, bottom: 5, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(const Profile(
                                          isBackButton: true,
                                        ));
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: K.primaryColor,
                                        child: const Icon(Icons.person_outline),
                                        radius: 32,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    Text(userName,
                                        style: K.textStyle2.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: K.primaryColor)),
                                    Text(
                                      userEmail,
                                      style: K.textStyle5
                                          .copyWith(color: K.primaryColor),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [],
                            ),
                          ),
                          Divider(
                            color: K.sixthColor.withOpacity(0.2),
                          ),
                          Tile(
                            text: Text('Settings',style: TextStyle(fontSize: 15.0)).tr(),
                            function: () {
                              Get.to(const SettingsScreen(), binding: SettingsBinding());
                            },
                            icon: Icons.settings,
                          ),
                          Tile(
                            text: Text('Post-Payments',style: TextStyle(fontSize: 15.0)).tr(),
                            function: () {
                              Get.to(
                                const ApprovalBooking(
                                  isBackButton: true,
                                ),
                                binding: SettingsBinding(),
                              );
                            },
                            icon: Icons.pending_actions,
                          ),
                          Tile(
                            text: Text('Booking',style: TextStyle(fontSize: 15.0)).tr(),
                            function: () {
                              Get.to(const Booking(isBackButton: true));
                            },
                            icon: FontAwesomeIcons.bookOpen,
                          ),
                          Tile(
                            text: Text('Invoices',style: TextStyle(fontSize: 15.0)).tr(),
                            function: () {
                              Get.to(
                                Invoices(
                                  isBackButton: true,
                                ),
                              );
                            },
                            icon: FontAwesomeIcons.fileInvoice,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 125,
                        child: TextButton(
                          onPressed: () {
                            userController.signOut();
                            K.localStorage.erase(); // Erase user data on sign out
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 15,
                                child: Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: K.eighthColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Log Out',
                                  style: K.textStyle2
                                      .copyWith(color: K.eighthColor),
                                ).tr(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
