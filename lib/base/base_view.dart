import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:school_manager/values/index.dart';

import 'index.dart';
import 'responsive_layout.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  // final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  ResponsiveLayout body(BuildContext context);
  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      // value: SystemUiOverlayStyle(
      //   //Status bar color for android
      //   statusBarColor: statusBarColor(),
      //   statusBarIconBrightness: Brightness.dark,
      // ),
      child: pageScaffold(context),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      // key: UniqueKey(),
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      drawerEnableOpenDragGesture: false,
      body: Stack(
        children: [
          pageContent(context),
          Obx(() {
            return controller.pageState == PageState.LOADING ? _showLoading() : Container();
          }),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [AppColors.primary.withOpacity(0.05), AppColors.white.withOpacity(0.1)],
          center: Alignment(-1.0, 1.0),
          radius: 1,
        )),
        child: SizedBox(height: Get.height, child: body(context)),
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }

  Color pageBackgroundColor() {
    return Get.theme.colorScheme.background;
  }

  Color statusBarColor() {
    return Colors.white;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return Stack(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const ModalBarrier(
          // color: Colors.black12.withOpacity(0.05),
          dismissible: false,
        ),
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
