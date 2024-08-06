import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class K {
  static Color darkBlue = const Color(0xFF002E5D);
  static Color primaryColor = const Color(0xff002E5D);
  static Color secondaryColor = const Color(0xFFFFFFFF);
  static Color tertiaryColor = const Color(0xff1B6ABA);
  static Color fourthColor = const Color(0xff000000);
  static Color fifthColor = const Color(0xff05D434);
  static Color sixthColor = const Color(0xff707070);
  static Color seventhColor = const Color(0xffF28608);
  static Color eighthColor = const Color(0xffE61C1C);
  static Color ninthColor = const Color(0xffEBDB15);
  static Color tenthColor = const Color(0xff989898);
  static Color eleventhColor = const Color(0xffE21616);
  static Color twelveColor = const Color(0xff13BCFA);
  static Color thirteenColor = const Color(0xffF70B0B);
  static Color fourteenColor = const Color(0xff393948);

  //Variables
  static final localStorage = GetStorage();
  static const double maxButtonSize = 400.0;
  static const String loggedInUser = 'loggedInUser';

  //Controller Tags

  static const String homeControllerTag = 'HomeController';
  static const String mainScreenControllerTag = 'MainScreenController';
  static const String profileControllerTag = 'ProfileController';
  static const String restaurantControllerTag = 'RestaurantController';
  static const String orderSummaryControllerTag = 'OrderSummaryControllerTag';
  static const String paymentControllerTag = 'PaymentControllerTag';
  static const String ordersControllerTag = 'OrdersControllerTag';
  static const String userControllerTag = 'UserControllerTag';
  static const String mapControllerTag = 'MapControllerTag';
  static const String filterControllerTag = 'FilterControllerTag';
  static const String addressControllerTag = 'AddressControllerTag';
  static const String allShopsControllerTag = 'AllShopsControllerTag';
  static const String favoritesControllerTag = 'favoritesControllerTag';
  static const String bookHelperControllerTag = 'bookHelperControllerTag';

  static const String googleMapApiKey =
      'AIzaSyCetgXGpC7IHj3AFOA0w1gCcWNSDIQn3nI';

  static var titleTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 50.0,
    color: primaryColor,
    wordSpacing: 0.5,
    letterSpacing: 0.5,
  );

  static var textStyle1 = GoogleFonts.sourceSansPro(
    fontSize: 20.0,
    color: fourthColor,
    fontWeight: FontWeight.w500,
    wordSpacing: 0.5,
    letterSpacing: 0.5,
  );
  static var textStyle2 = GoogleFonts.sourceSansPro(
    fontSize: 11.0,
    color: fourthColor,
    wordSpacing: 0.5,
    letterSpacing: 0.5,
  );
  static var textStyle3 = GoogleFonts.sourceSansPro(
    fontSize: 15.0,
    color: fourthColor,
    wordSpacing: 0.4,
    letterSpacing: 0.2,
  );
  static var textStyle4 = GoogleFonts.sourceSansPro(
    fontSize: 13.0,
    color: secondaryColor,
    height: 2,
    wordSpacing: 0.4,
    letterSpacing: 0.2,
  );
  static var textStyle5 = GoogleFonts.sourceSansPro(
    fontSize: 12.0,
    color: fourthColor,
    wordSpacing: 0.5,
    letterSpacing: 0.5,
  );
  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
    );
  }

  static SnackBar customSnackBar({
    required Widget child,
  }) {
    return SnackBar(
      content: child,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius?.circular(10) ?? BorderRadius?.circular(0.0),
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    );
  }
}
