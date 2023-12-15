import '../../../core/app_export.dart';
import '../controller/collaboration_start_controller.dart';

class NewCollaborationItemBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewCollaborationItemController>(
        () => NewCollaborationItemController());
  }
}
