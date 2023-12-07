import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({super.key, required this.mobileUI, required this.desktopUI});
  final Widget mobileUI;
  final Widget desktopUI;
  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isMobile) {
      return mobileUI;
    } else {
      return desktopUI;
    }
  }
}
