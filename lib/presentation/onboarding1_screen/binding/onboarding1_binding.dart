import '../controller/onboarding1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Onboarding1Screen.
///
/// This class ensures that the Onboarding1Controller is created when the
/// Onboarding1Screen is first loaded.
class Onboarding1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Onboarding1Controller());
  }
}
