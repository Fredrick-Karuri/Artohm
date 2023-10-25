import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/settings_screen/models/settings_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SettingsScreen.
///
/// This class manages the state of the SettingsScreen, including the
/// current settingsModelObj
class SettingsController extends GetxController {
  TextEditingController profileController = TextEditingController();

  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  @override
  void onClose() {
    super.onClose();
    profileController.dispose();
  }
}
