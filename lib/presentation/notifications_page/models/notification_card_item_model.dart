import '../../../core/app_export.dart';

/// This class is used in the [notificationcar_item_widget] screen.

enum NotificationType { comment, like, follow, mention }

class NotificationCardItemModel {
  NotificationCardItemModel({
    this.userName,
    this.notificationText,
    this.notificationTime,
    this.notificationComment,
    this.id,
    this.type,
  }) {
    userName = userName ?? Rx("@ArtEnthusiast23");
    notificationText = notificationText ?? Rx("Commented on your artwork");
    notificationTime = notificationTime ?? Rx("4 days ago");
    notificationComment = notificationComment ??
        Rx("“Your creativity knows no bounds! Keep up the fantastic work”");
    id = id ?? Rx("");
    
    type = type ?? Rx(NotificationType.comment);
  }

  Rx<String>? userName;

  Rx<String>? notificationText;

  Rx<String>? notificationTime;

  Rx<String>? notificationComment;

  Rx<String>? id;

  Rx<NotificationType>? type;
}
