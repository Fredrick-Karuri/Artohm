import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artwork_screen/models/artwork_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ArtworkScreen.
///
/// This class manages the state of the ArtworkScreen, including the
/// current artworkModelObj
class ArtworkController extends GetxController {
  TextEditingController commentController = TextEditingController();

  Rx<ArtworkModel> artworkModelObj = ArtworkModel().obs;

  @override
  void onClose() {
    super.onClose();
    commentController.dispose();
  }
}
