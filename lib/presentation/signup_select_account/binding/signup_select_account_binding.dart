import 'package:get/get.dart';
import '../controller/signup_select_account_controller.dart';

class SelectAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountTypeController());
  }
}
