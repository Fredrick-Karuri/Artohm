import '../../../core/app_export.dart';
import 'selectedstyles_item_model.dart';

/// This class defines the variables used in the [edit_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EditProfileModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Impressionism",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Cubism",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Surrealism",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Abstract Expressionism",
    ),
    SelectionPopupModel(
      id: 5,
      title: "Pop Art",
    ),
  ]);

  Rx<List<SelectedstylesItemModel>> selectedstylesItemList = Rx(
    List.generate(
      2,
      (index) => SelectedstylesItemModel(),
    ),
  );
}

class UserProfile {
  final String label;
  final String value;
  final String iconPath;
  final Function(String) onChanged;

  UserProfile({
    required this.label,
    required this.value,
    required this.iconPath,
    required this.onChanged,
  });
  // convert a userprofile object into a map object
}

class SocialMedia {
  final String logoPath;
  final String name;
  final String url;

  SocialMedia({required this.name, required this.url, required this.logoPath});
}


