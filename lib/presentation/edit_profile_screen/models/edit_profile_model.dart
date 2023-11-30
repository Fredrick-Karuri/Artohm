import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'selectedstyles_item_model.dart';

/// This class defines the variables used in the [edit_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EditProfileModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
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
  ]);

  Rx<List<SelectedstylesItemModel>> selectedstylesItemList = Rx(
    List.generate(
      2,
      (index) => SelectedstylesItemModel(),
    ),
  );
}

class UserProfile {
  String username;
  String email;
  String bio;
  String location;
  String website;
  // String imagePath;

  UserProfile({
    required this.username,
    required this.email,
    required this.bio,
    required this.location,
    required this.website,
    // required this.imagePath,
  });
}
