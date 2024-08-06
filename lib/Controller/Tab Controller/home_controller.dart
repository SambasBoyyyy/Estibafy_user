// import 'package:get/get.dart';
// import 'package:google_place/google_place.dart';
//
// class HomeController extends GetxController {
//   RxBool loading = false.obs;
//   RxnString address = RxnString();
//   GooglePlace googlePlace =
//       GooglePlace('AIzaSyA9iAMQIryMYdiIYxNaALHeW5PvN2g6XbI');
//   RxList<AutocompletePrediction> predictions = RxList<AutocompletePrediction>();
//
//   void autoCompleteSearch(String value) async {
//     var result = await googlePlace.autocomplete.get(value);
//     if (result != null && result.predictions != null) {
//       predictions.value = result.predictions!;
//     }
//     loading.value = false;
//   }
// }
