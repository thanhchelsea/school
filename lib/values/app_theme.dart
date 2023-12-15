import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/values/padding.dart';
import '../tools/text_style.dart';
import 'app_colors.dart';

class AppThemes {
  ///Config ThemeData For LightMode
  static ThemeData lightTheme(BuildContext context) {
    final baseTheme = ThemeData.light();

    // TextTheme textTheme = getTextTheme(baseTheme.textTheme, context)..apply(fontSizeFactor: 1);
    return ThemeData(
      // textTheme: textTheme,
      fontFamily: "Poppins",
      primaryColor: AppColors.primary,
      canvasColor: const Color(0xFFFFFFFF),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary,
      ),
      shadowColor: AppColors.primary.withOpacity(0.25),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      cardColor: Colors.white,
      primaryIconTheme: baseTheme.iconTheme.copyWith(
        color: AppColors.primary,
      ),
      indicatorColor: const Color(0xFF565656),
      iconTheme: baseTheme.iconTheme.copyWith(
        color: Colors.black,
      ),
      checkboxTheme: CheckboxThemeData(),
      scaffoldBackgroundColor: Color(0xfffafafc),
      dividerTheme: const DividerThemeData(
        thickness: 1.0,
        color: Color(0xFFEAF0FD),
      ),
      dividerColor: const Color(0xFFEAF0FD),
      disabledColor: Colors.grey[400],
      appBarTheme: AppBarTheme(
        color: baseTheme.cardColor,
        // titleTextStyle: textTheme.subtitle2,
        iconTheme: const IconThemeData(color: Color(0xFF212633)),
      ),

      highlightColor: AppColors.primary,
      colorScheme: const ColorScheme.light().copyWith(
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
        background: AppColors.background,
        primary: AppColors.primary,
        primaryContainer: Color(0xffcfe2f5), //mau khong dc helight
        shadow: Colors.black12,
        error: Colors.red,
      ),
      cardTheme: baseTheme.cardTheme.copyWith(
        elevation: 0.0,
        shadowColor: Colors.black12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        isDense: true,
        hintStyle: TextStyle(fontSize: 12),
        contentPadding: EdgeInsets.symmetric(horizontal: padding12, vertical: padding),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GetPlatform.isAndroid || GetPlatform.isIOS ? 12 : 8),
          borderSide: const BorderSide(color: AppColors.primary),
          gapPadding: 30.0,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GetPlatform.isAndroid || GetPlatform.isIOS ? 12 : 8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GetPlatform.isAndroid || GetPlatform.isIOS ? 12 : 8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GetPlatform.isAndroid || GetPlatform.isIOS ? 12 : 8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GetPlatform.isAndroid || GetPlatform.isIOS ? 12 : 8),
          borderSide: BorderSide(color: AppColors.primary.withOpacity(0.2)),
        ),
      ),
    );
  }

  ///Config ThemeData For DarkMode
  static ThemeData darkTheme(BuildContext context) {
    final baseTheme = ThemeData.dark();
    // TextTheme textTheme = getTextTheme(baseTheme.textTheme, context);
    return baseTheme.copyWith(
      // textTheme: textTheme,
      dividerColor: const Color(0xFF353F4A),
      scaffoldBackgroundColor: const Color(0xFF2A3139),
      cardColor: const Color(0xFF1E252D),
      primaryColor: const Color(0xFF3366FF),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF3366FF),
      ),
      appBarTheme: AppBarTheme(
        color: const Color(0xFF171717),
        // titleTextStyle: textTheme.subtitle2,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }

  ThemeData getTheme(BuildContext context, bool isLight) {
    if (isLight) {
      return lightTheme(context);
    } else {
      return darkTheme(context);
    }
  }
}
