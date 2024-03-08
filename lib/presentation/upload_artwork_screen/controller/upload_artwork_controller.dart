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
  Rx<UploadArtworkModel> uploadArtworkModelObj = UploadArtworkModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  final ImagePicker _picker = ImagePicker();

  TextEditingController inputTitleController = TextEditingController();
  TextEditingController inputDescriptionController = TextEditingController();
  TextEditingController inputWidthController = TextEditingController();
  TextEditingController inputHeightController = TextEditingController();
  FocusNode inputTitleFocusNode = FocusNode();
  FocusNode inputDescriptionFocusNode = FocusNode();
  FocusNode inputWidthFocusNode = FocusNode();
  FocusNode inputHeightFocusNode = FocusNode();
  @override
  void onClose() {
    super.onClose();
    inputTitleController.dispose();
    inputDescriptionController.dispose();
    inputTitleFocusNode.dispose();
    inputDescriptionFocusNode.dispose();
    inputWidthController.dispose();
    inputHeightController.dispose();
    inputWidthFocusNode.dispose();
    inputHeightFocusNode.dispose();
  }

  onSelectedDimensions(int value) {
    for (var element
        in uploadArtworkModelObj.value.dimensionsDropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value) {
        // Now we're comparing two integers
        element.isSelected = true;
      }
    }
    uploadArtworkModelObj.value.dimensionsDropdownItemList.refresh();
  }

  onSelectedMedium(int value) {
    for (var element
        in uploadArtworkModelObj.value.mediumDropdownItemList.value) {
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

class ArtworkTypeController extends GetxController {
  var selectedArtworkType = ''.obs;
}

class ArtworkTagController extends GetxController {
  TextEditingController inputTagController = TextEditingController();
  FocusNode inputTagFocusNode = FocusNode();

  void onClose() {
    super.onClose();
    inputTagController.dispose();
    inputTagFocusNode.dispose();
  }

  void addTag() {
    if (inputTagController.text.isNotEmpty) {
      selectedTags.add(inputTagController.text);
      inputTagController.clear();
    }
  }

  var selectedTags = <String>[].obs;
}

class ArtworkSaleController extends GetxController {
  var isForSale = false.obs;
  var price = 0.0.obs;
  var currency = ''.obs;
  TextEditingController priceController = TextEditingController();
  FocusNode priceFocusNode = FocusNode();
  List<String> currencies = ['KSH', 'USD'].obs;

  void onClose() {
    super.onClose();
    priceController.dispose();
    priceFocusNode.dispose();
  }

  void updateSaleInfo(bool forSale, String? newPrice, String? newCurrency) {
    isForSale.value = forSale;
    price.value = double.tryParse(newPrice ?? '') ?? 0.0;
    currency.value = newCurrency ?? '';
  }
}