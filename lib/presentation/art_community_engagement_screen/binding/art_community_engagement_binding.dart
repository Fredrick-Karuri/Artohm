import '../controller/art_community_engagement_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtCommunityEngagementScreen.
///
/// This class ensures that the ArtCommunityEngagementController is created when the
/// ArtCommunityEngagementScreen is first loaded.
class ArtCommunityEngagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtCommunityEngagementController());
  }
}
