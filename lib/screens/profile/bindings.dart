import 'package:get/get.dart';
import 'package:school_manager/screens/profile/controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
