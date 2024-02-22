import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:artohmapp/presentation/collaborate_screen/models/collaborate_model.dart';

/// A controller class for the CollaborateScreen.
///
/// This class manages the state of the CollaborateScreen, including the
/// current collaborateModelObj
class CollaborateController extends GetxController {
  Rx<CollaborateModel> collaborateModelObj = CollaborateModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in collaborateModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    collaborateModelObj.value.dropdownItemList.refresh();
  }
}
