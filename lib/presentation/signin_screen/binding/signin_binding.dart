import '../controller/signin_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SigninScreen.
///
/// This class ensures that the SigninController is created when the
/// SigninScreen is first loaded.
class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController());
  }
}
