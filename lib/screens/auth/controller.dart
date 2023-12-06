import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/base/index.dart';
import 'package:school_manager/models/index.dart';
import 'package:school_manager/repositories/index.dart';

class AuthController extends BaseController {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameTextEditCtrl = TextEditingController();
  TextEditingController passwordTextEditCtrl = TextEditingController();
  ServerRepository serverRepo = ServerRepository();
  Rxn<User?> user = Rxn<User?>();

  @override
  void onReady() async {
    // TODO: implement onReady
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
          print(user.value?.toJson());
        },
      );
    }
  }
}
