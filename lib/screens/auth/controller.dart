import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/base/index.dart';
import 'package:school_manager/models/index.dart';
import 'package:school_manager/repositories/index.dart';
import 'package:school_manager/routes/app_routers.dart';
import 'package:school_manager/utils/preference/preference_impl.dart';

class AuthController extends BaseController {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameTextEditCtrl = TextEditingController();
  TextEditingController passwordTextEditCtrl = TextEditingController();
  ServerRepository serverRepo = ServerRepository();
  PreferenceImpl _store = PreferenceImpl();
  Rxn<User?> user = Rxn<User?>();
  String x = "1";
  @override
  void onReady() async {
    // TODO: implement onReady
    // checkLogin();
    super.onReady();
  }

  void signIn() async {
    x = "2";
    Get.toNamed(RouterNames.HOME);
    return;
    if (formKey.currentState!.validate()) {
      var signIn = serverRepo.signIn(
        username: usernameTextEditCtrl.text.trim(),
        password: passwordTextEditCtrl.text.trim(),
      );
      callDataService(
        signIn,
        onSuccess: (response) {
          user.value = response as User;
          _store.writeStore(key: PreferenceImpl.sessionId, value: user.value!.sessionId);
          print(user.value?.toJson());
        },
      );
    }
  }

  void checkLogin() async {
    String sessionId = await _store.readStore(key: PreferenceImpl.sessionId) ?? "";
    print("ssid: $sessionId");
  }
}
