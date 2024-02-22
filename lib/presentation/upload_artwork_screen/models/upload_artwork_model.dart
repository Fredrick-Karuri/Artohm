import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';

import '../../../core/app_export.dart';

/// This class defines the variables used in the [upload_artwork_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class UploadArtworkModel {
  Rx<List<SelectionPopupModel>> dimensionsDropdownItemList = Rx(
    [
      SelectionPopupModel(
        title: "cm",
        isSelected: true,
      ),
      SelectionPopupModel(
        title: "Inches",
      ),
    ],
  );

  Rx<List<SelectionPopupModel>> mediumDropdownItemList = Rx(
    [
      SelectionPopupModel(
        title: "Oil",
        isSelected: true,
      ),
      SelectionPopupModel(
        title: "Acrylic",
      ),
      SelectionPopupModel(
        title: "Watercolor",
      ),
      SelectionPopupModel(
        title: "Pastel",
      ),
      SelectionPopupModel(
        title: "Charcoal",
      ),
      SelectionPopupModel(
        title: "Pencil",
      ),
      SelectionPopupModel(
        title: "Digital",
      ),
      SelectionPopupModel(
        title: "Mixed Media",
      ),
    ],
  );
}
