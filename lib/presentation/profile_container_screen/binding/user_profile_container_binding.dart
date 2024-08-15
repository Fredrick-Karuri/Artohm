import 'package:artohmapp/presentation/upload_artwork_screen/controller/upload_artwork_controller.dart';

import '../controller/user_profile_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UserProfileContainerScreen.
///
/// This class ensures that the UserProfileContainerController is created when the
/// UserProfileContainerScreen is first loaded.
class UserProfileContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProfileContainerController());
    Get.lazyPut(()=>UploadArtworkController());
  }
}
