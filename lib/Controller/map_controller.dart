import 'package:estibafy_user/models/Classes/map_model.dart';
import 'package:get/get.dart';

class MpController extends GetxController {
  Rx<MapLocation> pickedUpResult = MapLocation().obs;

  RxBool isMapSelected = false.obs;

  setMapLocation(double lat, double lng,String address, bool value) {
    pickedUpResult.value.latitude = lat;
    pickedUpResult.value.longitude = lng;
    pickedUpResult.value.address = address;
    isMapSelected.value = value;
    update();
    print('This is picked up locaiton' +
        pickedUpResult.value.latitude.toString() +
        ' ' +
        pickedUpResult.value.longitude.toString());
  }
}
