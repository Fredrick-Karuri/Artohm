import '../controller/collaborate_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CollaborateScreen.
///
/// This class ensures that the CollaborateController is created when the
/// CollaborateScreen is first loaded.
class CollaborateBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(() => CollaborateController(), permanent: true);
    Get.lazyPut(() => CollaborateController());
  }
}
