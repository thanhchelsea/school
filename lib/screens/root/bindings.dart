import 'package:get/get.dart';
import '../settings.dart/controller.dart';
import 'controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut(() => LanguageController(), fenix: true);
  }
}
