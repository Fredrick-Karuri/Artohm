import '../../../core/app_export.dart';

/// This class is used in the [row_item_widget] screen.
class RowItemModel {
  Rx<String> select = Rx("Everyone");

  Rx<bool> isSelected = Rx(false);
}
