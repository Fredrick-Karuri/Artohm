import 'package:artohmapp/presentation/community_screen/controller/art_community_controller.dart';
import 'package:artohmapp/presentation/marketplace_screen/controller/marketplace_controller.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/collaborate_screen/controller/collaborate_controller.dart';

import '../controller/art_discovery_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtDiscoveryContainerScreen.
///
/// This class ensures that the ArtDiscoveryContainerController is created when the
/// ArtDiscoveryContainerScreen is first loaded.
class ArtDiscoveryContainerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ArtDiscoveryContainerController>(
    //     () => ArtDiscoveryContainerController());
    // Get.lazyPut<ArtCommunityController>(() => ArtCommunityController());
    // Get.lazyPut<ArtCommunityController>(() => ArtCommunityController());
    // Get.lazyPut<MarketplaceController>(() => MarketplaceController());

    // Get.put(ArtDiscoveryContainerController());
    // Get.put(ArtCommunityController());
    // Get.put(CollaborateController());
    // Get.put(MarketplaceController());
    Get.lazyPut<ArtDiscoveryContainerController>(
        () => ArtDiscoveryContainerController(),
        fenix: true);
    Get.lazyPut<ArtCommunityController>(() => ArtCommunityController(),
        fenix: true);
    Get.lazyPut<CollaborateController>(() => CollaborateController(),
        fenix: true);
    Get.lazyPut<MarketplaceController>(() => MarketplaceController(),
        fenix: true);
    Get.lazyPut(() => FavoriteArtworksController(), fenix: true);
  }
}
