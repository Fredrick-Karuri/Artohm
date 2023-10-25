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
  }
}
