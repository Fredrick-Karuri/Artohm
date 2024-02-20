import '../controller/signup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupOneScreen.
///
/// This class ensures that the SignupController is created when the
/// SignupOneScreen is first loaded.
class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
