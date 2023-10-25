import '../controller/modal_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ModalScreen.
///
/// This class ensures that the ModalController is created when the
/// ModalScreen is first loaded.
class ModalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModalController());
  }
}
