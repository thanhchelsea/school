import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/utils/index.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'routes/app_routers.dart';
import 'screens/settings.dart/controller.dart';
import 'values/app_theme.dart';

void main() async {
  Get.lazyPut(() => LanguageController(), fenix: true);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (languageController) {
        return GetMaterialApp(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          onInit: () {},

          translations: Localization(),
          locale: languageController.getLocale,
          navigatorObservers: [],
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme(context), //AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme(context),
          themeMode: ThemeMode.light,
          initialRoute: RouterNames.AUTH,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
