import 'package:estibafy_user/Controller/user_controller.dart';
import 'package:estibafy_user/models/utils/constants.dart';
import 'package:estibafy_user/models/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Controller/map_controller.dart';
import '../drawer.dart';
import 'book_helpers_data_collection.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LatLng currentLocation = const LatLng(40.937100, -73.050480);

  @override
  Widget build(BuildContext context) {
    final UserController _userController = Get.find(tag: K.userControllerTag);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: getAppBar('Book Helpers', _scaffoldKey),
      key: _scaffoldKey,
      backgroundColor: K.secondaryColor,
      drawer: const SideDrawer(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            // Container(
            //   height: 50.0,
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            //   width: double.infinity,
            //   color: K.secondaryColor,
            //   child: Text('Good Morning ${_userController.user.value.name}'),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.710,
              child: googleMapLocationPicker(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget googleMapLocationPicker(BuildContext context) {
    return MapLocationPicker(

      bottomCardColor: K.secondaryColor,
      currentLatLng: currentLocation,
      showBackButton: false,
      desiredAccuracy: LocationAccuracy.best,
      bottomCardIcon: Icon(
        Icons.forward,
        color: K.primaryColor,
      ),
      apiKey: K.googleMapApiKey,

      onNext: (GeocodingResult? result) {
        MpController mpController = Get.put(MpController());
        mpController.setMapLocation(
            result!.geometry.location.lat,
            result.geometry.location.lng,
            result.formattedAddress.toString(),
            true);
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const BookHelpersDataCollection(),
          withNavBar: true,
        );
      },
    );
    // return MapLocationPicker(
    //   showMoreOptions: false,
    //   desiredAccuracy: LocationAccuracy.best,
    //   minMaxZoomPreference: const MinMaxZoomPreference(8, 30),
    //   bottomCardColor: K.primaryColor,
    //   bottomCardIcon: Icon(
    //     Icons.navigate_next_outlined,
    //     color: K.secondaryColor,
    //   ),
    //   searchHintText: 'Search or Pick Location',
    //   apiKey: K.googleMapApiKey,
    //   showBackButton: false,
    //   compassEnabled: false,
    //   canPopOnNextButtonTaped: false,
    //   onNext: (LatLng? result, GeocodingResult? address) {
    //     log(result!.latitude.toString());
    //     log(result.longitude.toString());
    //
    //   },
    //   onSuggestionSelected: (PlacesDetailsResponse? result) {
    //     if (result != null) {}
    //   },
    // );
  }
}
