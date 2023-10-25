import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/user_profile_container_screen/models/user_profile_container_model.dart';

/// A controller class for the UserProfileContainerScreen.
///
/// This class manages the state of the UserProfileContainerScreen, including the
/// current userProfileContainerModelObj
class UserProfileContainerController extends GetxController {
  Rx<UserProfileContainerModel> userProfileContainerModelObj =
      UserProfileContainerModel().obs;
}
