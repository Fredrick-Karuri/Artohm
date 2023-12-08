import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

/// This class is used in the [marketplacechip_item_widget] screen.
class MarketplaceChipItemModel {
  MarketplaceChipItemModel({
    this.label,
    this.id,
    this.iconData,
  }) {
    label = label ?? Rx("");
    id = id ?? Rx("");
    iconData = iconData ?? Icons.help; // default icon
  }

  Rx<String>? label;
  Rx<String>? id;
  IconData? iconData;
}

