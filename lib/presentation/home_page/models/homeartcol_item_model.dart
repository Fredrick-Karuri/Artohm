import '../../../core/app_export.dart';

/// This class is used in the [homeartcol_item_widget] screen.
class HomeartcolItemModel {
  HomeartcolItemModel({
    this.aiArtPushingTex,
    this.id,
  }) {
    aiArtPushingTex = aiArtPushingTex ?? Rx("AI Art: Pushing Boundaries");
    id = id ?? Rx("");
  }

  Rx<String>? aiArtPushingTex;

  Rx<String>? id;
}
