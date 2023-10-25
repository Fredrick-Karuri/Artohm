import '../../../core/app_export.dart';
import 'notificationcar_item_model.dart';

/// This class defines the variables used in the [notifications_page],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel {
  Rx<List<NotificationcarItemModel>> notificationcarItemList =
      Rx(List.generate(5, (index) => NotificationcarItemModel()));
}
