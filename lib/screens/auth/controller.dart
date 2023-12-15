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
  final PreferenceImpl _store = PreferenceImpl();
  Rxn<User?> user = Rxn<User?>();
  String x = "1";
  @override
  void onReady() async {
    super.onReady();
  }

  void signIn() async {
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
          Get.offAllNamed(RouterNames.HOME);
        },
      );
    }
  }

  Future<bool> checkLogin() async {
    String sessionId = await _store.readStore(key: PreferenceImpl.sessionId) ?? "";
    if (sessionId.isNotEmpty) {
      var signInWithSSid = serverRepo.signInWithSessionId(
        sessionId: sessionId,
      );
      await callDataService(
        signInWithSSid,
        onSuccess: (response) {
          if (response != null) {
            print("Check login oke: <3");
            user.value = response;
            usernameTextEditCtrl.clear();
            passwordTextEditCtrl.clear();
            return true;
          } else {
            Get.offAllNamed(RouterNames.AUTH);
          }
        },
        onError: (exception) {
          if (Get.currentRoute != RouterNames.AUTH) {
            Get.offAllNamed(RouterNames.AUTH);
          }
        },
      );
    } else {
      Get.offAllNamed(RouterNames.AUTH);
    }
    return false;
  }

  Future signOut() async {
    await _store.remove(PreferenceImpl.sessionId);
    Get.offAllNamed(RouterNames.AUTH);
  }
}
