import 'package:artohmapp/core/app_export.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  final SharedPreferences prefs;

  SplashController(this.prefs) {
    print('SplashController created'); // Add this line
  }

  @override
  void onReady() {
    super.onReady();
    print('SplashController onReady called'); // Add this line
    _navigateToNextScreen();
  }

 void _navigateToNextScreen() async {
  bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
  print('Onboarding completed: $onboardingCompleted'); // Add this line
  await Future.delayed(Duration(seconds: 3));
  String nextRoute = onboardingCompleted ? AppRoutes.artDiscoveryContainerScreen : AppRoutes.onboardingScreen;
  print('Navigating to: $nextRoute'); // Add this line
  Get.offAllNamed(nextRoute);
}

}
