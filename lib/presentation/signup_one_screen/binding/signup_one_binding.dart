import '../controller/signup_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupOneScreen.
///
/// This class ensures that the SignupOneController is created when the
/// SignupOneScreen is first loaded.
class SignupOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupOneController());
  }
}
