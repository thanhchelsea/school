import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:school_manager/base/index.dart';
import 'package:school_manager/screens/home/controller.dart';
import 'package:school_manager/tools/text_style.dart';

class HomeUI extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text(
        "Home",
        style: getTextTheme(TextSystem.bodyLarge, context),
      ),
    );
  }
}
