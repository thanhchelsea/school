import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:school_manager/values/index.dart';

class AppLogo extends StatelessWidget {
  AppLogo({super.key, this.radius = 50, this.backgroundColor});
  double radius;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? Colors.transparent,
      backgroundImage: AssetImage(AppImages.logoApp),
    );
  }
}
