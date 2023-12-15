import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/routes/app_routers.dart';

import 'index.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gfdg"),
        centerTitle: true,
      ),
      //body: HomeView(),

      body: GetRouterOutlet(
        initialRoute: RouterNames.AUTH,
        // anchorRoute: '/',
      ),
    );
  }
}
