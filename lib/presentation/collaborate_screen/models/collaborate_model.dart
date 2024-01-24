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
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ],
  );
  
}

