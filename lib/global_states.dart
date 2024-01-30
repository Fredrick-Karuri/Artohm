import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoggedIn =
      false.obs; // Save the isLoggedIn status in shared preferences

  void setIsLoggedIn(bool value) {
    isLoggedIn.value = value;
    // Save the isLoggedIn status in shared preferences
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isLoggedIn', value);
    });
  }

  void loadIsLoggedIn() {
    // Load the isLoggedIn status from shared preferences
    SharedPreferences.getInstance().then((prefs) {
      isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
    });
  }
}

class GlobalOnboardingController extends GetxController {
  var onboardingCompleted = false.obs;

  void setOnboardingCompleted(bool value) {
    onboardingCompleted.value = value;
    // Save the onboardingCompleted status in shared preferences
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('onboardingCompleted', value);
    });
  }

  Future<void> loadOnboardingCompleted() async {
    // Load the onboardingCompleted status from shared preferences
    SharedPreferences.getInstance().then((prefs) {
      onboardingCompleted.value = prefs.getBool('onboardingCompleted') ?? false;
    });
  }
}
