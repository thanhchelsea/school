import 'package:get/get.dart';
import 'package:school_manager/base/index.dart';
import 'package:school_manager/models/index.dart';
import 'package:school_manager/repositories/index.dart';
import 'package:school_manager/screens/auth/controller.dart';
import 'package:school_manager/utils/index.dart';
import 'package:school_manager/utils/preference/preference_impl.dart';

class HomeController extends BaseController {
  AuthController authCtrl = Get.find();
  RxList<Role> roles = <Role>[].obs;
  String x = "";
  final RxInt _bottomNavIndex = 0.obs;
  int get bottomNavIndex => _bottomNavIndex.value;
  ServerRepository serverRepo = ServerRepository();
  final PreferenceImpl _store = PreferenceImpl();
  setBottomNavIndex(int index) => _bottomNavIndex(index);
  @override
  void onReady() async {
    await getAllRole();
    var handleCheckLogin = authCtrl.checkLogin();
    await callDataService(
      handleCheckLogin,
      onSuccess: (response) {},
    );
    super.onReady();
  }

  getAllRole() async {
    var handleGetAllRole = serverRepo.getAllRole();
    await callDataService(
      handleGetAllRole,
      onSuccess: (response) {
        roles.value = response;
        if (roles.isNotEmpty) {
          _store.writeStore(key: PreferenceImpl.roles, value: response);
          ClientData.roles = response;
        }
      },
      onError: (exception) async {
        roles.value = await _store.readStore(key: PreferenceImpl.roles);
        ClientData.roles = roles.value;
      },
    );
  }
}
