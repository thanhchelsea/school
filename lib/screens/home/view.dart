import 'package:flutter/material.dart';
import 'package:school_manager/base/index.dart';
import 'package:school_manager/screens/home/controller.dart';
import 'package:school_manager/screens/home/desktop_ui.dart';
import 'package:school_manager/screens/home/mobile_ui.dart';
import 'package:school_manager/tools/text_style.dart';

import '../../base/responsive_layout.dart';

class HomeUI extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  ResponsiveLayout body(BuildContext context) {
    return ResponsiveLayout(
      mobileUI: HomeUIMobile(),
      desktopUI: HomeDesktopUI(),
    );
  }
}
