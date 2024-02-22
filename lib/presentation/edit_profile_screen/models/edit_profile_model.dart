import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';

import '../../../core/app_export.dart';

/// This class defines the variables used in the [edit_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EditProfileModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx(
    [
      SelectionPopupModel(
        title: "Impressionism",
      ),
      SelectionPopupModel(
        title: "Cubism",
      ),
      SelectionPopupModel(
        title: "Surrealism",
      ),
      SelectionPopupModel(
        title: "Abstract Expressionism",
      ),
      SelectionPopupModel(
        title: "Pop Art",
      ),
      SelectionPopupModel(
        title: "Art Deco",
      ),
      SelectionPopupModel(
        title: "Minimalism",
      ),
      SelectionPopupModel(
        title: "Expressionism",
      ),
      SelectionPopupModel(
        title: "Baroque",
      ),
      SelectionPopupModel(
        title: "Realism",
      ),
      SelectionPopupModel(
        title: "Rococo",
      ),
      SelectionPopupModel(
        title: "Art Nouveau",
      ),
      SelectionPopupModel(
        title: "Modernism",
      ),
      SelectionPopupModel(
        title: "Neoclassicism",
      ),
    ],
  );

  Rx<List<SelectedstylesItemModel>> selectedstylesItemList = Rx(
    List.generate(
      0,
      (index) => SelectedstylesItemModel(),
    ),
  );
}

// class SelectionPopupModel {
//   static int _counter = 0;
//   final int id;
//   final String title;
//   bool isSelected;
//   dynamic value;



//   SelectionPopupModel({required this.title, this.isSelected = false, this.value})
//       : id = _counter++,
//         super();
// }
//list


class SelectedstylesItemModel {
  Rx<String> chips2filterb = Rx("");

  Rx<bool> isSelected = Rx(false);
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
