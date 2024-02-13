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


/// This class is used in the [home_model] screen.
class HomeChipFilterModel {
  Rx<String> label;
  Rx<String> id;
  Rx<bool> isSelected;

  HomeChipFilterModel({
    String? label,
    String? id,
    bool? isSelected,
  })  : this.label = Rx<String>(label ?? ""),
        this.id = Rx<String>(id ?? ""),
        this.isSelected = Rx<bool>(isSelected ?? false);
}
