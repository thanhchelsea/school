import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:school_manager/base/index.dart';
import 'package:school_manager/base/responsive_layout.dart';
import 'package:school_manager/screens/auth/controller.dart';
import 'package:school_manager/screens/auth/desktop_ui.dart';
import 'package:school_manager/screens/auth/mobile_ui.dart';
import 'package:school_manager/tools/text_style.dart';
import 'package:school_manager/utils/index.dart';
import 'package:school_manager/values/index.dart';
import 'package:school_manager/widgets/index.dart';
import 'package:school_manager/widgets/logo_app.dart';
import 'package:school_manager/widgets/text_field.dart';

import '../../widgets/check_box.dart';

class AuthUI extends BaseView<AuthController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  ResponsiveLayout body(BuildContext context) {
    return ResponsiveLayout(
      mobileUI: AuthMobileUI(controller: controller),
      desktopUI: AuthDesktopUI(controller: controller),
    );
  }
}
