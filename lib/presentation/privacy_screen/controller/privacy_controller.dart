import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/privacy_screen/models/privacy_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the PrivacyScreen.
///
/// This class manages the state of the PrivacyScreen, including the
/// current privacyModelObj
enum PrivacySetting { Everyone, FollowersOnly, Private }

class PrivacyController extends GetxController {
  Rx<PrivacyModel> privacyModelObj = PrivacyModel().obs;

  Rx<PrivacySetting> currentSetting = PrivacySetting.Everyone.obs;

  @override
  void onInit() {
    super.onInit();
    loadSwitchState();
    privacyModelObj.value = PrivacyModel();
  }

  void loadSwitchState() async {
    String setting = await getSwitchState("currentSetting");
    switch (setting) {
      case "FollowersOnly":
        currentSetting.value = PrivacySetting.FollowersOnly;
        break;
      case "Private":
        currentSetting.value = PrivacySetting.Private;
        break;
      default:
        currentSetting.value = PrivacySetting.Everyone;
        break;
    }
  }

  void setSwitchState(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getSwitchState(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "Everyone";
  }




void updateSwitchState(PrivacySetting setting) {
  currentSetting.value = setting;
  setSwitchState("currentSetting", setting.toString().split('.').last);
}

}
