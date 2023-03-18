import 'dart:collection';

import 'package:eduyaari02/screens/dashboard_page.dart';
import 'package:eduyaari02/screens/demo.dart';
import 'package:eduyaari02/screens/exam_list_screen.dart';
import 'package:eduyaari02/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'bindings/initial_binding.dart';
import 'controllers/common/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: Get.find<ThemeController>().getLightheme(),
            darkTheme: Get.find<ThemeController>().getDarkTheme(),
            // getPages: AppRoutes.pages(),
            debugShowCheckedModeBanner: false,
            home: LandingPage(),
          );
        });
  }
}
