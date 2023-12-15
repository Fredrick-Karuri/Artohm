import 'package:artohmapp/presentation/collaborate_start_screen/collaborate_start_screen.dart';
import 'package:artohmapp/presentation/collaborate_start_screen/models/collaboration_start_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCollaborationItemController extends GetxController {
  // Define your variables here. For example:
  TextEditingController inputNameController = TextEditingController();
  TextEditingController inputDescriptionController = TextEditingController();
  TextEditingController inputCollaboratorsController = TextEditingController();
  Rx<NewCollaborationItemModel> newCollaborationItemModelObj =
      NewCollaborationItemModel().obs;
  RxString title = ''.obs;
  RxList<String> imagePaths = <String>[].obs;
  FocusNode nameFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode collaboratorsFocusNode = FocusNode();

  // Add more variables as needed...

  // Define your methods here. For example:
  void setTitle(String newTitle) {
    title.value = newTitle;
  }

  void addImagePath(String imagePath) {
    imagePaths.add(imagePath);
  }
  // Add more methods as needed...

  onSelected(dynamic value) {
    for (var element
        in newCollaborationItemModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        {
          element.isSelected = true;
        }
      }
    }
    newCollaborationItemModelObj.value.dropdownItemList.refresh();
  }

  @override
  void onClose() {
    super.onClose();
    inputNameController.dispose();
    inputDescriptionController.dispose();
    nameFocusNode.dispose();
    descriptionFocusNode.dispose();
    collaboratorsFocusNode.dispose();
  }
}
