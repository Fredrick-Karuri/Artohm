import '../../../core/app_export.dart';
import '../controller/collaboration_start_confirmation_controller.dart';

class CollaborationStartConfirmationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollaborationStartConfirmationController>(() => CollaborationStartConfirmationController());
  }
}
