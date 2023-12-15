import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:school_manager/base/index.dart';
import 'package:school_manager/base/responsive_layout.dart';
import 'package:school_manager/screens/profile/controller.dart';

import 'desktop.dart';
import 'mobile.dart';

class ProfileUI extends BaseView<ProfileController> {
  @override
  // TODO: implement tag
  String? get tag => Get.arguments ?? "home";
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  ResponsiveLayout body(BuildContext context) {
    return ResponsiveLayout(
      mobileUI: ProfileUIMobile(),
      desktopUI: ProfileDesktopUI(),
    );
  }
}
