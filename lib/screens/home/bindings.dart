import 'package:get/get.dart';
import 'package:school_manager/screens/home/controller.dart';
import 'package:school_manager/screens/profile/controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProfileController(), tag: "home");
  }
}
