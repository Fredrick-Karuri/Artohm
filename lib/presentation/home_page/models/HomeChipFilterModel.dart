import '../../../core/app_export.dart';

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
