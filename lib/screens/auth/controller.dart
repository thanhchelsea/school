import 'package:flutter/material.dart';
import 'package:school_manager/base/index.dart';

class AuthController extends BaseController {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameTextEditCtrl = TextEditingController();
  TextEditingController passwordTextEditCtrl = TextEditingController();

  void signin() async {
    if (formKey.currentState!.validate()) {}
  }
}
