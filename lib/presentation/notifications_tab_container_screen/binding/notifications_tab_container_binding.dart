import '../controller/notifications_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationsTabContainerScreen.
///
/// This class ensures that the NotificationsTabContainerController is created when the
/// NotificationsTabContainerScreen is first loaded.
class NotificationsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsTabContainerController());
  }
}
