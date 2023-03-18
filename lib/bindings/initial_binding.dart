import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/common/theme_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());


    Get.lazyPut<HomeController>(() => HomeController(),
        // Get.lazyPut<LoginController>(() => LoginController(),

    );


  }
}
