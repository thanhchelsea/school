import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/tools/text_style.dart';
import 'package:school_manager/values/index.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    required this.labelText,
    required this.onPressed,
    this.colorBackground, //= AppColors.colorPrimaryApp
    this.colorText = Colors.white,
    this.width,
    this.fontWeight = FontWeight.w600,
    this.fontSizeText,
    this.showShadow = true,
    this.padding,
    this.borderRadius,
    this.boxShadow,
    this.titleWidget,
    this.boxBorder,
    this.colorsGradient,
  });
  List<Color>? colorsGradient;
  final double? width;
  final String labelText;
  final void Function() onPressed;
  final Color? colorBackground;
  final Color colorText;
  final FontWeight fontWeight;
  final double? fontSizeText;
  final bool showShadow;
  final EdgeInsets? padding;
  final BoxShadow? boxShadow;
  final Widget? titleWidget;
  double? borderRadius;
  BoxBorder? boxBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: colorBackground == null
            ? LinearGradient(
                colors: colorsGradient ?? [AppColors.primary, AppColors.primary],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: colorBackground,
        boxShadow: showShadow
            ? [
                boxShadow ??
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 0,
                      offset: Offset(0, 15),
                      color: AppColors.primary.withOpacity(0.1),
                    )
              ]
            : [],
        border: boxBorder,
        borderRadius: BorderRadius.circular(borderRadius ?? (GetPlatform.isMobile ? 20 : 10)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: AppColors.primary.withOpacity(0.2),
          backgroundColor: Colors.transparent,
          // primary: colorBackground,
          minimumSize: padding != null ? Size.zero : null, // Set this
          padding: padding != null ? EdgeInsets.zero : null, // and this
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
          ),
        ),
        child: titleWidget ??
            Container(
              padding: padding ??
                  EdgeInsets.symmetric(
                      vertical: getSizeResponsive(
                          defaultSize: GetPlatform.isMobile ? 16 : 14, mobileSize: 16, desktopSize: 14)),
              // width: double.infinity,
              child: Text(
                labelText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSizeText ?? 14,
                  fontWeight: fontWeight,
                  color: colorText,
                ),
              ),
            ),
      ),
    );
  }
}
