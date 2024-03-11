import '../../../core/app_export.dart';

/// This class is used in the [engagementcard_item_widget] screen.
class EngagementcardItemModel {
  EngagementcardItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
