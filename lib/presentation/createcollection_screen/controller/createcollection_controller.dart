import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/createcollection_screen/models/createcollection_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the CreatecollectionScreen.
///
/// This class manages the state of the CreatecollectionScreen, including the
/// current createcollectionModelObj
class CreatecollectionController extends GetxController {
  TextEditingController nameController = TextEditingController();

  Rx<CreatecollectionModel> createcollectionModelObj =
      CreatecollectionModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  Rx<bool> isSelectedSwitch1 = false.obs;

  Rx<bool> isSelectedSwitch2 = false.obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
