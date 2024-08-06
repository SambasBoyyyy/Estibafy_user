import 'package:estibafy_user/Controller/navigation_bar_controller.dart';
import 'package:estibafy_user/Views/pages/invoices/invoices.dart';
import 'package:estibafy_user/Views/pages/profile/profile.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

import 'book_helpers/home.dart';
import 'bookings/booking.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final tabs = [
    const Home(),
    Invoices(
      isBackButton: false,
    ),
    const Booking(isBackButton: false),
    // Invoices(isBackButton: false),
    const Profile(isBackButton: false),
  ];

  NavigationBarController navigationBarController =
      Get.put(NavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: navigationBarController.tabController,
        screens: tabs,
        confineInSafeArea: true,
        navBarHeight: 60,
        backgroundColor: K.primaryColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style7,
        items: persistentItems(context),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> persistentItems(context) {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.home, size: 18),
      title: 'Home',
      textStyle: K.textStyle3.copyWith(fontSize: 14),
      activeColorPrimary: Colors.white,
      activeColorSecondary: K.fourthColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.history, size: 18),
      title: 'Invoices',
      textStyle: K.textStyle3.copyWith(fontSize: 14),
      activeColorPrimary: Colors.white,
      activeColorSecondary: K.fourthColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.bookOpen, size: 18),
      title: 'Booking',
      textStyle: K.textStyle3.copyWith(fontSize: 14),
      activeColorPrimary: Colors.white,
      activeColorSecondary: K.fourthColor,
    ),

    // PersistentBottomNavBarItem(
    //   icon: const Icon(FontAwesomeIcons.bookOpen, size: 22),
    //   title: 'Booking',
    //   textStyle: K.textStyle3.copyWith(fontSize: 16),
    //   activeColorPrimary: Colors.white,
    //   activeColorSecondary: K.fourthColor,
    // ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.userAlt, size: 18),
      title: 'Profile',
      textStyle: K.textStyle3.copyWith(fontSize: 14),
      activeColorPrimary: Colors.white,
      activeColorSecondary: K.fourthColor,
    ),
  ];
}
