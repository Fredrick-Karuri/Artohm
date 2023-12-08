import 'package:artohmapp/presentation/splashscreen/controller/splashscreen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
        () => SplashController(Get.find<SharedPreferences>()));
  }
}
