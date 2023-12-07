import 'package:get/get.dart';
import 'package:school_manager/base/index.dart';
import 'package:school_manager/screens/auth/controller.dart';

class HomeController extends BaseController {
  AuthController authCtrl = Get.find();
  String x = "";
  @override
  void onReady() {
    // TODO: implement onReady
    x = authCtrl.x;
    print("$x");
    super.onReady();
  }
}
