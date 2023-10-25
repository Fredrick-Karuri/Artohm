import '../controller/collaborateitem_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CollaborateitemScreen.
///
/// This class ensures that the CollaborateitemController is created when the
/// CollaborateitemScreen is first loaded.
class CollaborateitemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollaborateitemController());
  }
}
