import '../../../core/app_export.dart';

/// This class is used in the [notificationcar_item_widget] screen.
class NotificationcarItemModel {
  NotificationcarItemModel({
    this.userName,
    this.notificationTex,
    this.notificationTim,
    this.notificationCom,
    this.id,
  }) {
    userName = userName ?? Rx("@ArtEnthusiast23");
    notificationTex = notificationTex ?? Rx("Commented on your artwork");
    notificationTim = notificationTim ?? Rx("4 days ago");
    notificationCom = notificationCom ??
        Rx("“Your creativity knows no bounds! Keep up the fantastic work”");
    id = id ?? Rx("");
  }

  Rx<String>? userName;

  Rx<String>? notificationTex;

  Rx<String>? notificationTim;

  Rx<String>? notificationCom;

  Rx<String>? id;
}
