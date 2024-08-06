import 'package:url_launcher/url_launcher.dart';

class BookingRepo {
  static openDialer({required String number}) async {
    launch("tel://$number");
  }
}
