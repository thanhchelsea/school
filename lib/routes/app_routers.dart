import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:school_manager/screens/auth/index.dart';
import 'package:school_manager/screens/profile/bindings.dart';
import 'package:school_manager/screens/profile/view.dart';
import '../screens/home/index.dart';
import '../screens/root/index.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static const initial = RouterNames.HOME;

  static final routes = [
    GetPage(
      name: RouterNames.AUTH,
      binding: AuthBindings(),
      page: () => AuthUI(),
    ),
    GetPage(
      name: RouterNames.HOME,
      binding: HomeBindings(),
      page: () => HomeUI(),
      // middlewares: [RouterMiddleWare()],
    ),
    GetPage(
      name: RouterNames.PROFILE,
      binding: ProfileBindings(),
      page: () => ProfileUI(),
      // middlewares: [RouterMiddleWare()],
    ),
  ];

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouterNames.AUTH,
        builder: (BuildContext context, GoRouterState state) {
          return AuthUI();
        },
      ),
    ],
  );
}

class RouterNames {
  RouterNames._();
  static const SFLASH = '/';
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const PROFILE = '/profile';
}

class RouterMiddleWare extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    if (Get.find<AuthController>().user.value == null) {
      // Get.rootDelegate.offAndToNamed(RouterNames.AUTH);
      return GetPage(
        name: RouterNames.AUTH,
        binding: AuthBindings(),
        page: () => AuthUI(),
      );
    }
    print("da co ssid");
    return page;
  }

  @override
  RouteSettings? redirect(String? route) {
    // return const RouteSettings(name: RouterNames.AUTH);

    // if (Get.find<AuthController>().user.value == null) {
    //   print("asasasa");
    //   // Get.rootDelegate.offAndToNamed(RouterNames.AUTH);
    //   return const RouteSettings(name: RouterNames.AUTH);
    // }
    // print("da co ssid");
    // return null;
  }
}
