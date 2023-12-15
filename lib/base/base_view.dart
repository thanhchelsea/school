import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:school_manager/values/index.dart';
import 'package:school_manager/widgets/index.dart';

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
      body: ZoomDrawer(
        controller: controller.zoomDrawerController,
        menuScreen: DrawerApp(),
        mainScreenScale: 0.1,

        mainScreenTapClose: true,
        disableDragGesture: true,
        mainScreen: Scaffold(
          //sets ios status bar color
          // backgroundColor: Colors.transparent,
          // key: UniqueKey(),
          appBar: appBar(context),
          drawerEnableOpenDragGesture: false,
          body: Stack(
            children: [
              pageContent(context),
              Obx(() {
                return controller.pageState == PageState.LOADING ? _showLoading() : Container();
              }),
            ],
          ),
          drawer: drawer(),
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0,
        // menuBackgroundColor: Get.theme.colorScheme.secondary,
        drawerShadowsBackgroundColor: Color.fromARGB(255, 209, 201, 241),
        slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.fastOutSlowIn,
        // closeCurve: Curves.bounceIn,
      ),
    );
    return Scaffold(
      //sets ios status bar color
      // backgroundColor: Colors.transparent,
      // key: UniqueKey(),
      appBar: appBar(context),
      drawerEnableOpenDragGesture: false,
      body: Stack(
        children: [
          pageContent(context),
          Obx(() {
            return controller.pageState == PageState.LOADING ? _showLoading() : Container();
          }),
        ],
      ),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        width: Get.width,
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
    return FloatingActionButton(
      onPressed: () {},
      //params
    );
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return Stack(
      children: [
        ModalBarrier(
          dismissible: false,
          color: Colors.black12.withOpacity(0.02),
        ),
        Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: Get.theme.primaryColor,
            size: 45,
          ),
        ),
      ],
    );
  }
}
