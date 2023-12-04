import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetX;
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

///1:Display hoặc Headline hoặc title Text (headline1, headline2, ...):
///Sử dụng cho các tiêu đề lớn, quan trọng, thu hút sự chú ý.
/// Ví dụ: Tiêu đề của một trang, tiêu đề của một bài viết, tiêu đề của một danh mục quan trọng.
///
///2: Body Text (bodyText1, bodyText2):

/// Dùng để hiển thị nội dung chính trong ứng dụng.
/// bodyLarge có thể được sử dụng cho văn bản chính trong các mục quan trọng.
/// bodyMedium có thể được sử dụng cho văn bản nhỏ gọn, mà không làm mất quá nhiều không gian.
///
/// 3:Caption Text hoặc bodySmall / labelSmall (caption):

/// Thường được sử dụng cho các đoạn văn bản nhỏ, thông tin phụ thuộc vào ngữ cảnh.
/// Điển hình là các chú thích, thông tin chi tiết ngắn, hoặc các đoạn văn ngắn không quan trọng.

enum TextSystem {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineMedium,
  headlineSmall,
  titleLarge,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelSmall,
}

getTextTheme(TextSystem textSystem, BuildContext context) {
  // return textTheme;

  switch (textSystem) {
    case TextSystem.displayLarge:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 24.0),
              const Condition.equals(name: TABLET, value: 26.0),
              const Condition.equals(name: DESKTOP, value: 28.0),
              const Condition.largerThan(name: DESKTOP, value: 30.0),
            ],
            defaultValue: 24.0,
          ).value,
          fontWeight: FontWeight.bold,
        );
      }
    case TextSystem.displayMedium:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 22.0),
              const Condition.equals(name: TABLET, value: 24.0),
              const Condition.equals(name: DESKTOP, value: 26.0),
              const Condition.largerThan(name: DESKTOP, value: 28.0),
            ],
            defaultValue: 22.0,
          ).value,
          fontWeight: FontWeight.bold,
        );
      }
    case TextSystem.displaySmall:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 20.0),
              const Condition.equals(name: TABLET, value: 22.0),
              const Condition.equals(name: DESKTOP, value: 24.0),
              const Condition.largerThan(name: DESKTOP, value: 26.0),
            ],
            defaultValue: 20.0,
          ).value,
          fontWeight: FontWeight.bold,
        );
      }
    case TextSystem.headlineMedium:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 18.0),
              const Condition.equals(name: TABLET, value: 20.0),
              const Condition.equals(name: DESKTOP, value: 24.0),
              const Condition.largerThan(name: DESKTOP, value: 26.0),
            ],
            defaultValue: 18.0,
          ).value,
          fontWeight: FontWeight.bold,
        );
      }
    case TextSystem.headlineSmall:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 16.0),
              const Condition.equals(name: TABLET, value: 18.0),
              const Condition.equals(name: DESKTOP, value: 20.0),
              const Condition.largerThan(name: DESKTOP, value: 22.0),
            ],
            defaultValue: 16.0,
          ).value,
          fontWeight: FontWeight.bold,
        );
      }
    case TextSystem.titleLarge:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 14.0),
              const Condition.equals(name: TABLET, value: 16.0),
              const Condition.equals(name: DESKTOP, value: 18.0),
              const Condition.largerThan(name: DESKTOP, value: 20.0),
            ],
            defaultValue: 14.0,
          ).value,
          fontWeight: FontWeight.bold,
        );
      }

    // Body Text
    case TextSystem.bodyLarge:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 100.0),
              const Condition.equals(name: TABLET, value: 18.0),
              const Condition.equals(name: DESKTOP, value: 20.0),
              const Condition.largerThan(name: DESKTOP, value: 22.0),
            ],
            defaultValue: 16.0,
          ).value,
          color: Colors.red,
        );
      }
    case TextSystem.bodyMedium:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 14.0),
              const Condition.equals(name: TABLET, value: 16.0),
              const Condition.equals(name: DESKTOP, value: 18.0),
              const Condition.largerThan(name: DESKTOP, value: 20.0),
            ],
            defaultValue: 14.0,
          ).value,
        );
      }

    case TextSystem.bodySmall:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 12.0),
              const Condition.equals(name: TABLET, value: 14.0),
              const Condition.equals(name: DESKTOP, value: 16.0),
              const Condition.largerThan(name: DESKTOP, value: 18.0),
            ],
            defaultValue: 12.0,
          ).value,
          color: Colors.grey,
        );
      }

    case TextSystem.labelSmall:
      {
        return TextStyle(
          fontSize: ResponsiveValue<double>(
            context,
            conditionalValues: [
              const Condition.equals(name: MOBILE, value: 10.0),
              const Condition.equals(name: TABLET, value: 12.0),
              const Condition.equals(name: DESKTOP, value: 14.0),
              const Condition.largerThan(name: DESKTOP, value: 16.0),
            ],
            defaultValue: 10.0,
          ).value,
          color: Colors.grey,
        );
      }
  }
}

getDescWhite({
  BuildContext? context,
  double? fonstSize,
  Color? color,
  FontWeight? fontWeight,
  TextDecoration? textDecoration,
  FontStyle? fontStyle,
}) {
  return TextStyle(
    fontSize: ResponsiveValue<double>(
      context ?? GetX.Get.context!,
      conditionalValues: [
        const Condition.equals(name: MOBILE, value: 10.0),
        const Condition.equals(name: TABLET, value: 12.0),
        const Condition.equals(name: DESKTOP, value: 14.0),
        const Condition.largerThan(name: DESKTOP, value: 16.0),
      ],
      defaultValue: 10.0,
    ).value,
    color: color,
    fontWeight: fontWeight,
    decoration: textDecoration,
    fontStyle: fontStyle, //nghieng hoac bth
  );
}
