import '../../../core/app_export.dart';

class ChipController extends GetxController {
  var isSelected = false.obs;

  void toggleChipSelection() {
    isSelected.value = !isSelected.value;
  }
}
