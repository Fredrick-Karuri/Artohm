import '../controller/artist_profile_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtistProfileScreen.
///
/// This class ensures that the ArtistProfileController is created when the
/// ArtistProfileScreen is first loaded.
class ArtistProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtistProfileController());
  }
}
