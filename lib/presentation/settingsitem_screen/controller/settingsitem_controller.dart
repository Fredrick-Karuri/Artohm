import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/settingsitem_screen/models/settingsitem_model.dart';

/// A controller class for the SettingsitemScreen.
///
/// This class manages the state of the SettingsitemScreen, including the
/// current settingsitemModelObj
class SettingsitemController extends GetxController {
  Rx<SettingsitemModel> settingsitemModelObj = SettingsitemModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;
  Rx<bool> isSelectedSwitch2 = false.obs;
}
