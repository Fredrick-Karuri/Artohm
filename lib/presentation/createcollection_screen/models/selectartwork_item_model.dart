import 'dart:ui';

import '../../../core/app_export.dart';

/// This class is used in the [selectartwork_item_widget] screen.
class SelectartworkItemModel {
  SelectartworkItemModel({
    this.txt,
    this.id,
    this.imagePath,
  }) {
    txt = txt ?? Rx("Enchanted Forest");
    id = id ?? Rx("");
    imagePath = imagePath ?? Rx(ImageConstant.imgRectangle11135x108); // default image
  }

  Rx<String>? txt;
  Rx<String>? id;
  Rx<String>? imagePath; // Add this line
}

