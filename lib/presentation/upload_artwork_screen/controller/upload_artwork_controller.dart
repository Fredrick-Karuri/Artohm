import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:artohmapp/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/models/upload_artwork_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// A controller class for the UploadArtworkScreen.
///
/// This class manages the state of the UploadArtworkScreen, including the
/// current uploadArtworkModelObj
class UploadArtworkController extends GetxController {
  TextEditingController inputTextController = TextEditingController();

  TextEditingController inputtextoneController = TextEditingController();

  Rx<UploadArtworkModel> uploadArtworkModelObj = UploadArtworkModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  final ImagePicker _picker = ImagePicker();

  @override
  void onClose() {
    super.onClose();
    inputTextController.dispose();
    inputtextoneController.dispose();
  }

  onSelectedDimensions(int value) {
    for (var element in uploadArtworkModelObj.value.dimensionsDropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value) {
        // Now we're comparing two integers
        element.isSelected = true;
      }
    }
    uploadArtworkModelObj.value.dimensionsDropdownItemList.refresh();
  }

  onSelectedMedium(int value) {
    for (var element in uploadArtworkModelObj.value.mediumDropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value) {
        // Now we're comparing two integers
        element.isSelected = true;
      }
    }
    uploadArtworkModelObj.value.mediumDropdownItemList.refresh();
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // handle picked image
      print('image path:${image.path}');
    } else {
      print('no image selected');
    }
  }

  Future<void> takePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // handle taken picture
      print('image path:${image.path}');
    } else {
      print('no image selected');
    }
  }
}
