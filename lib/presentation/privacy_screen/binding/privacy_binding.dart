import '../controller/privacy_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PrivacyScreen.
///
/// This class ensures that the PrivacyController is created when the
/// PrivacyScreen is first loaded.
class PrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyController());
  }
}
