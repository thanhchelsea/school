import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/values/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardApp extends StatelessWidget {
  CardApp({
    super.key,
    this.padding,
    this.child,
    this.backgroundColor,
    this.shadowColor,
    this.width,
    this.height,
  });
  EdgeInsets? padding;
  Color? backgroundColor;
  Widget? child;
  double? width;
  double? height;

  Color? shadowColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.symmetric(horizontal: padding12, vertical: padding12),
      decoration: BoxDecoration(
        color: backgroundColor ?? Get.theme.cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            spreadRadius: 4,
            color: shadowColor ?? Color(0xfff5f6f7),
            offset: Offset(0, 10),
          )
        ],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: child,
    );
  }
}
