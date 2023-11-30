import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  TextEditingController inputTextController = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
   Rx<UserProfile> userProfile = UserProfile(
    username: 'Username',
    email: 'Email',
    bio: 'Bio',
    location: 'Location',
    website: 'Website',
    // imagePath: ImageConstant.imgProfileiconsRed30024x24,
  ).obs;

  SelectionPopupModel? selectedDropDownValue;
  final ImagePicker _picker = ImagePicker();

  @override
  void onClose() {
    super.onClose();
    inputTextController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in editProfileModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editProfileModelObj.value.dropdownItemList.refresh();
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
  void editProfileField(String field, String newValue) {
    switch (field) {
      case 'username':
        userProfile.value.username = newValue;
        break;
      case 'email':
        userProfile.value.email = newValue;
        break;
      case 'bio':
        userProfile.value.bio = newValue;
        break;
      case 'location':
        userProfile.value.location = newValue;
        break;
      case 'website':
        userProfile.value.website = newValue;
        break;
      default:
        print('Invalid field');
    }
  }
}
