import '../../../core/app_export.dart';

/// This class is used in the [row2_item_widget] screen.
class CommentVisibilityModel {
  Rx<String> select = Rx(" ");

  Rx<bool> isSelected = Rx(false);
}
