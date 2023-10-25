import '../../../core/app_export.dart';

/// This class is used in the [enchantedforest_item_widget] screen.
class EnchantedforestItemModel {
  EnchantedforestItemModel({
    this.txt,
    this.txtone,
    this.id,
  }) {
    txt = txt ?? Rx("Enchanted Forest");
    txtone = txtone ?? Rx("Jan 15, 2023");
    id = id ?? Rx("");
  }

  Rx<String>? txt;

  Rx<String>? txtone;

  Rx<String>? id;
}
