import 'package:get/get.dart';
import 'package:school_manager/screens/auth/index.dart';
import '../screens/home/index.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
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
    ),
  ];
}

class RouterNames {
  RouterNames._();
  static const SFLASH = '/';
  static const HOME = '/home';
  static const AUTH = '/Auth';
}
