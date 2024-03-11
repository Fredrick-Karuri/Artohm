import '../controller/art_community_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtCommunityScreen.
///
/// This class ensures that the ArtCommunityController is created when the
/// ArtCommunityScreen is first loaded.
class ArtCommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => ArtCommunityController(), permanent: true);
    
  }
}
