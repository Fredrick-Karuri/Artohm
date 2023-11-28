import 'package:artohmapp/presentation/art_community_engagement_screen/controller/art_community_engagement_controller.dart';
import 'package:artohmapp/presentation/art_community_screen/controller/art_community_controller.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/controller/art_marketplace_controller.dart';
import 'package:artohmapp/presentation/collaborate_screen/controller/collaborate_controller.dart';
import 'package:artohmapp/presentation/home_page/controller/home_controller.dart';

import '../controller/art_discovery_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtDiscoveryContainerScreen.
///
/// This class ensures that the ArtDiscoveryContainerController is created when the
/// ArtDiscoveryContainerScreen is first loaded.
class ArtDiscoveryContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtDiscoveryContainerController());
    Get.lazyPut<ArtCommunityController>(() => ArtCommunityController());
    Get.lazyPut<CollaborateController>(() => CollaborateController());
    Get.lazyPut<ArtMarketplaceController>(() => ArtMarketplaceController());
  }
}
