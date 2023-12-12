import '../../../core/app_export.dart';

/// This class is used in the [homeartcol_item_widget] screen.
class HomeartcolItemModel {
  HomeartcolItemModel({
    this.aiArtPushingTex,
    this.imagePaths,
    this.id,
  }) {
    aiArtPushingTex = aiArtPushingTex ?? Rx("AI Art: Pushing Boundaries");
    id = id ?? Rx("");
    imagePaths = imagePaths ?? Rx<List<String>>([]);
  }

  Rx<String>? aiArtPushingTex;

  Rx<String>? id;
  Rx<List<String>>? imagePaths;
}
