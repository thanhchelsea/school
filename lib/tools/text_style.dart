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

getDescWhite({
  required BuildContext? context,
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

double getSizeResponsive({
  BuildContext? context,
  required double defaultSize,
  double? mobileSize,
  double? tabletSize,
  double? desktopSize,
}) {
  var size = ResponsiveValue<double>(
        context ?? GetX.Get.context!,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: mobileSize),
          Condition.equals(name: TABLET, value: tabletSize),
          Condition.equals(name: DESKTOP, value: desktopSize),
          Condition.largerThan(name: DESKTOP, value: desktopSize),
        ],
        defaultValue: defaultSize,
      ).value ??
      0;
  return size;
}
