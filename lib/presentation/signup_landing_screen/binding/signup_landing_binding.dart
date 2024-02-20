import '../controller/signup_landing_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupScreen.
///
/// This class ensures that the SignupLandingController is created when the
/// SignupScreen is first loaded.
class SignupLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupLandingController());
  }
}
