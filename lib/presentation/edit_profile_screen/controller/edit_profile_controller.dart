import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:artohmapp/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  TextEditingController inputTextController = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  RxList<UserProfile> fields = <UserProfile>[].obs;
  FocusNode influencesFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    // Initialize your fields here
    fields.addAll(
      [
        UserProfile(
          label: 'Username',
          value: 'Your username',
          iconPath: ImageConstant.imgProfileiconsRed30024x24,
          onChanged: (value) {
            // Handle the change
            print('New value: $value');
          },
        ),
        UserProfile(
          label: 'Email',
          value: 'Your email',
          iconPath: ImageConstant.imgMailRed300,
          onChanged: (value) {
            // Handle the change
            print('New value: $value');
          },
        ),
        UserProfile(
          label: 'Bio',
          value: 'Exploring the beauty of art, one canvas at a time',
          iconPath: ImageConstant.imgProfileicons24x241,
          onChanged: (value) {
            // Handle the change
            print('New value: $value');
          },
        ),
        UserProfile(
          label: 'Location',
          value: 'Nairobi, Kenya',
          iconPath: ImageConstant.imgProfileicons24x242,
          onChanged: (value) {
            // Handle the change
            print('New value: $value');
          },
        ),
        UserProfile(
          label: 'Website',
          value: 'www.artlover.com',
          iconPath: ImageConstant.imgGlobeRed300,
          onChanged: (value) {
            // Handle the change
            print('New value: $value');
          },
        ),
      ],
    );
  }

  @override
  void onClose() {
    super.onClose();
    inputTextController.dispose();
    influencesFocusNode.dispose();
  }

  final ImagePicker _picker = ImagePicker();
  SelectionPopupModel? selectedDropDownValue;
  
  onSelected(int id) {
    var selectedItem = editProfileModelObj.value.dropdownItemList.value
        .firstWhereOrNull((item) => item.id == id);
    if (selectedItem != null) {
      // Create a new SelectedstylesItemModel with the selected style
      SelectedstylesItemModel newStyle = SelectedstylesItemModel();
      newStyle.chips2filterb.value = selectedItem.title;
      // Add the new style to the selectedstylesItemList
      editProfileModelObj.value.selectedstylesItemList.value.add(newStyle);
      // Remove the selected style from the dropdownItemList
      editProfileModelObj.value.dropdownItemList.value.remove(selectedItem);
      // Update the DropdownButtonFormField's value
      if (editProfileModelObj.value.dropdownItemList.value.isNotEmpty) {
        selectedDropDownValue =
            editProfileModelObj.value.dropdownItemList.value.first;
      } else {
        selectedDropDownValue = null;
      }
    }
    editProfileModelObj.value.dropdownItemList.refresh();
    editProfileModelObj.value.selectedstylesItemList.refresh();
  }

  // method to remove a selected style
  removeSelectedStyle(SelectedstylesItemModel style) {
    // Generate a unique id for the style to be added back to the dropdownItemList
    int newId = 1;
    if (editProfileModelObj.value.dropdownItemList.value.isNotEmpty) {
      newId = (editProfileModelObj.value.dropdownItemList.value
                  .map((item) => item.id)
                  .where((id) => id != null)
                  .reduce((a, b) => a! > b! ? a : b) ??
              0) +
          1;
    }

    // Add the style back to the dropdownItemList
    editProfileModelObj.value.dropdownItemList.value.add(SelectionPopupModel(
      title: style.chips2filterb.value,
    ));
    // Remove the selected style from the selectedstylesItemList
    editProfileModelObj.value.selectedstylesItemList.value.remove(style);
    editProfileModelObj.value.dropdownItemList.refresh();
    editProfileModelObj.value.selectedstylesItemList.refresh();
  }

  Future<void> changeProfilePhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the picked image
      print('Image path: ${image.path}');
    } else {
      print('No image selected.');
    }
  }

  void updateField(String label, String newValue) {
    for (var i = 0; i < fields.length; i++) {
      var field = fields[i];
      if (field.label == label) {
        fields[i] = UserProfile(
          label: field.label,
          value: newValue,
          iconPath: field.iconPath,
          onChanged: field.onChanged,
        );
        break;
      }
    }
  }
}

class SocialMediaController {
  void launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}

class InfluencesController extends GetxController {
  var artistsList = [
    'Leonardo da Vinci',
    'Vincent Van Gogh',
    'Michelangelo',
    'Rembrandt',
    'Claude Monet',
    'Pablo Picasso',
    'Georgia O\'Keeffe',
    'Andy Warhol',
    'Frida Kahlo',
    'Banksy'
  ].obs;
  var selectedArtists = <String>[].obs; // Add this line

  // This function will be used to fetch the list of artists from the backend
  Future<void> fetchArtists() async {
    // TODO: Call your backend API to fetch the list of artists
    // Update the artistsList with the result
  }
}
