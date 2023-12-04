import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_manager/utils/index.dart';

import 'routes/app_routers.dart';
import 'screens/settings.dart/controller.dart';

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
          onInit: () {},
          translations: Localization(),
          locale: languageController.getLocale,
          navigatorObservers: [],
          debugShowCheckedModeBanner: false,
          // theme: AppThemes.lightTheme(context), //AppThemes.lightTheme,
          // darkTheme: AppThemes.darkTheme(context),
          // themeMode: controller.themeMode ?? ThemeMode.light,
          initialRoute: RouterNames.HOME,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
