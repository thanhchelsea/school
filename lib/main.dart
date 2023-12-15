import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_manager/utils/index.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'routes/app_routers.dart';
import 'screens/auth/controller.dart';
import 'screens/root/bindings.dart';
import 'screens/settings.dart/controller.dart';
import 'values/app_theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  await GetStorage.init();
  usePathUrlStrategy();
  print("chay lai main me rrr");
  Get.put(AuthController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    return GetBuilder<LanguageController>(
      builder: (languageController) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: () {
            return GetMaterialApp(
              initialBinding: RootBinding(),
              builder: (context, child) {
                return ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                  ],
                );
              },

              onInit: () {},
              translations: Localization(),
              locale: languageController.getLocale,
              navigatorObservers: [],
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme(context), //AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme(context),
              themeMode: ThemeMode.light,
              initialRoute: AppRoutes.initial,
              getPages: AppRoutes.routes,
              unknownRoute: GetPage(name: '/notfound', page: () => Text("notfound")),
              // routerDelegate: AppRouterDelegate(),
              useInheritedMediaQuery: false,
              defaultTransition: Transition.rightToLeft,
              transitionDuration: const Duration(microseconds: 300),
            );
          },
        );
      },
    );
  }
}

//===============
class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.key,
      reportsRouteUpdateToEngine: true,
      onGenerateRoute: (settings) {
        print("===== ${settings.name}");
      },
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(RouterNames.AUTH)!.currentPage!],
    );
  }
}
