import 'package:artohmapp/presentation/notifications_page/models/notifications_model.dart';
import 'package:get/get.dart';
import '../controller/notifications_controller.dart';

/// A binding class for the NotificationsPage.
///
/// This class ensures that the NotificationsController is created when the
/// NotificationsPage is first loaded.
class NotificationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsController(NotificationsModel().obs));
  }
}
