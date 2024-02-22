import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:artohmapp/presentation/edit_profile_screen/models/edit_profile_model.dart';

import '../../../core/app_export.dart';
import 'chipviewselect_item_model.dart';

/// This class defines the variables used in the [collaborate_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CollaborateModel {
  Rx<List<ChipviewselectItemModel>> chipviewselectItemList =
      Rx(List.generate(3, (index) => ChipviewselectItemModel()));

  Rx<List<SelectionPopupModel>> dropdownItemList = Rx(
    [
      SelectionPopupModel(
        title: "Item One",
      ),
      SelectionPopupModel(
        title: "Item Two",
      ),
      SelectionPopupModel(
        title: "Item Three",
      )
    ],
  );
  
}

