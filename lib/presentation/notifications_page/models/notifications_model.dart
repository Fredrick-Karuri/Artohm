import '../../../core/app_export.dart';
import 'notification_card_item_model.dart';

/// This class defines the variables used in the [notifications_page],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel {
  Rx<List<NotificationCardItemModel>> notificationCardItemList =
      Rx<List<NotificationCardItemModel>>(sampleNotifications);

  // This function filters the notifications based on a type.
  List<NotificationCardItemModel> filterNotifications(String type) {
    return notificationCardItemList.value
        .where((notification) => notification.type!.value == type)
        .toList();
  }
}

List<NotificationCardItemModel> sampleNotifications = [
  NotificationCardItemModel(
    userName: Rx("@ArtEnthusiast23"),
    notificationText: Rx("Commented on your artwork"),
    notificationTime: Rx("4 days ago"),
    notificationComment:
        Rx("“Your creativity knows no bounds! Keep up the fantastic work”"),
    id: Rx("1"),
    type: Rx(NotificationType.comment),
  ),
  NotificationCardItemModel(
    userName: Rx("@PhotoFanatic"),
    notificationText: Rx("Liked your post"),
    notificationTime: Rx("2 hours ago"),
    id: Rx("2"),
    type: Rx(NotificationType.like),
  ),
  NotificationCardItemModel(
    userName: Rx("@TravelBlogger"),
    notificationText: Rx("Started following you"),
    notificationTime: Rx("1 day ago"),
    id: Rx("3"),
    type: Rx(NotificationType.follow),
  ),
  NotificationCardItemModel(
    userName: Rx("@Foodie"),
    notificationText: Rx("Mentioned you in a comment"),
    notificationTime: Rx("3 days ago"),
    notificationComment: Rx("“@YourUsername, have you tried this recipe yet?”"),
    id: Rx("4"),
    type: Rx(NotificationType.mention),
  ),
  NotificationCardItemModel(
    userName: Rx("@trendsetter"),
    notificationText: Rx("Commented on your artwork"),
    notificationTime: Rx("4 days ago"),
    notificationComment: Rx("You are recognized as one of the best"),
    id: Rx("5"),
    type: Rx(NotificationType.comment),
  ),
];
