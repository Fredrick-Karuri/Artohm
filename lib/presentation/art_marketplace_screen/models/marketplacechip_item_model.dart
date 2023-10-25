import '../../../core/app_export.dart';

/// This class is used in the [marketplacechip_item_widget] screen.
class MarketplacechipItemModel {
  MarketplacechipItemModel({
    this.label,
    this.id,
  }) {
    label = label ?? Rx("Paintings");
    id = id ?? Rx("");
  }

  Rx<String>? label;

  Rx<String>? id;
}
