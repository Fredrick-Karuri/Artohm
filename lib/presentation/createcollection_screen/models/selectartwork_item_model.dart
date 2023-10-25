import '../../../core/app_export.dart';

/// This class is used in the [selectartwork_item_widget] screen.
class SelectartworkItemModel {
  SelectartworkItemModel({
    this.txt,
    this.id,
  }) {
    txt = txt ?? Rx("Enchanted Forest");
    id = id ?? Rx("");
  }

  Rx<String>? txt;

  Rx<String>? id;
}
