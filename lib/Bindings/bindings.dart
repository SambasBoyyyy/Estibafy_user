import 'package:estibafy_user/Controller/Setting-Controller/setttings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
    }
}