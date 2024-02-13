import 'package:artohmapp/presentation/home_page/controller/home_controller.dart';
import 'package:artohmapp/presentation/home_page/models/home_model_populated.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPasswordScreen.
///
/// This class ensures that the ForgotPasswordController is created when the
/// ForgotPasswordScreen is first loaded.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => ForgotPasswordController());
    Get.lazyPut(() => HomeController(Rx<HomeModel>(HomeModel())));
  }
}
