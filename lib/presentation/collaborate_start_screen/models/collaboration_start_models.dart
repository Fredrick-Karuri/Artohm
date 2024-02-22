import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:artohmapp/presentation/edit_profile_screen/models/edit_profile_model.dart';

class NewCollaborationItemModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx(
    [
      SelectionPopupModel(
        title: 'Oil',
        isSelected: false,
      ),
      SelectionPopupModel(
        title: 'Acrylic',
        isSelected: false,
      ),
      SelectionPopupModel(
        title: 'Watercolor',
        isSelected: false,
      ),
      SelectionPopupModel(
        title: 'Gouache',
        isSelected: false,
      ),
      SelectionPopupModel(
        title: 'Ink',
        isSelected: false,
      ),
      SelectionPopupModel(
        title: 'Pastel',
        isSelected: false,
      ),
      SelectionPopupModel(
        title: 'Charcoal',
        isSelected: false,
      ),
      SelectionPopupModel(
        title: 'Pencil',
        isSelected: false,
      ),
      SelectionPopupModel(
        title: 'Digital',
      ),
    ],
  );
}
