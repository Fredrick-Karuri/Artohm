import '../../../core/app_export.dart';

/// This class defines the variables used in the [upload_artwork_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class UploadArtworkModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx(
    [
      SelectionPopupModel(
        id: 1,
        title: "cm",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Inches",
      ),
    ],
  );

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx(
    [
      SelectionPopupModel(
        id: 1,
        title: "Oil",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Acrylic",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Watercolor",
      ),
      SelectionPopupModel(
        id: 4,
        title: "Pastel",
      ),
      SelectionPopupModel(
        id: 5,
        title: "Charcoal",
      ),
      SelectionPopupModel(
        id: 6,
        title: "Pencil",
      ),
      SelectionPopupModel(
        id: 7,
        title: "Digital",
      ),
      SelectionPopupModel(
        id: 8,
        title: "Mixed Media",
      ),
    ],
  );
}
