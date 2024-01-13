import 'dart:ffi';

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

  SelectionPopupModel? selectedDropDownValue;
  final ImagePicker _picker = ImagePicker();

  @override
  void onClose() {
    super.onClose();
    inputTextController.dispose();
    influencesFocusNode.dispose();

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
