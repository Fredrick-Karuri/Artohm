import 'package:artohmapp/data/localStorage.dart';
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
  final localStorageService = Get.put(LocalStorageService());

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

  final removedItems = <SelectionPopupModel>[].obs;
  // SelectionPopupModel? selectedDropDownValue;
  int? selectedDropDownValue;

  onSelected(int id) {
    var selectedItem = editProfileModelObj.value.dropdownItemList.value
        .firstWhereOrNull((item) => item.id == id);
    if (selectedItem != null) {
      // Add the selected item to the selectedstylesItemList
      editProfileModelObj.value.selectedstylesItemList.value.add(
          SelectedstylesItemModel(
              id: selectedItem.id, chips2filterbValue: selectedItem.title));
      // Remove the selected item from the dropdownItemList
      editProfileModelObj.value.dropdownItemList.value.remove(selectedItem);
      // Set the value of the dropdown to null or to the id of another item in the list
      selectedDropDownValue = 0; // or some other id in the list
    }
    editProfileModelObj.value.dropdownItemList.refresh();
    editProfileModelObj.value.selectedstylesItemList.refresh();
  }

// method to remove a selected style
  removeSelectedStyle(SelectedstylesItemModel style) {
    // Add the removed style to the removedItems list
    removedItems.add(SelectionPopupModel(title: style.chips2filterb.value));
    // Remove the selected style from the selectedstylesItemList
    editProfileModelObj.value.selectedstylesItemList.value.remove(style);
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
