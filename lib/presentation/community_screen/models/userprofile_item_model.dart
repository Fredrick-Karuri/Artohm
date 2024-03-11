import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userName,
    this.userBio,
    this.userDescription,
    this.id,
  }) {
    userName = userName ?? Rx("CreativeSoul");
    userBio = userBio ?? Rx("Mastering Watercolor Techniques");
    userDescription =
        userDescription ?? Rx("I found this amazing tutorial that...");
    id = id ?? Rx("");
  }

  Rx<String>? userName;

  Rx<String>? userBio;

  Rx<String>? userDescription;

  Rx<String>? id;
}
