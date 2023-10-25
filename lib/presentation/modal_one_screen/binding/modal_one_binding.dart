import '../controller/modal_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ModalOneScreen.
///
/// This class ensures that the ModalOneController is created when the
/// ModalOneScreen is first loaded.
class ModalOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModalOneController());
  }
}
