import 'package:artohmapp/core/app_export.dart';

class NewCollaborationItemModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx(
    [
      SelectionPopupModel(
        title: 'Oil',
        isSelected: false,
        id: 1,
      ),
      SelectionPopupModel(
        title: 'Acrylic',
        isSelected: false,
        id: 1,
      ),
      SelectionPopupModel(
        title: 'Watercolor',
        isSelected: false,
        id: 2,
      ),
      SelectionPopupModel(
        title: 'Gouache',
        isSelected: false,
        id: 3,
      ),
      SelectionPopupModel(
        title: 'Ink',
        isSelected: false,
        id: 4,
      ),
      SelectionPopupModel(
        title: 'Pastel',
        isSelected: false,
        id: 5,
      ),
      SelectionPopupModel(
        title: 'Charcoal',
        isSelected: false,
        id: 6,
      ),
      SelectionPopupModel(
        title: 'Pencil',
        isSelected: false,
        id: 7,
      ),
      SelectionPopupModel(
        title: 'Digital',
        isSelected: false,
        id: 8,
      ),
    ],
  );
}
