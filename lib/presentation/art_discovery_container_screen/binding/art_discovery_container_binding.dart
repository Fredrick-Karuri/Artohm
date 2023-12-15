import 'package:artohmapp/presentation/art_community_engagement_screen/controller/art_community_engagement_controller.dart';
import 'package:artohmapp/presentation/art_community_screen/controller/art_community_controller.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/controller/art_marketplace_controller.dart';
import 'package:artohmapp/presentation/artist_profile_screen/controller/artist_profile_controller.dart';
import 'package:artohmapp/presentation/artwork_screen/controller/artwork_controller.dart';
import 'package:artohmapp/presentation/collaborate_screen/controller/collaborate_controller.dart';
import 'package:artohmapp/presentation/collaborateitem_screen/controller/collaborateitem_controller.dart';
import 'package:artohmapp/presentation/home_page/controller/home_controller.dart';
import 'package:artohmapp/presentation/user_profile_container_screen/controller/user_profile_container_controller.dart';

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
    // Get.lazyPut<ArtMarketplaceController>(() => ArtMarketplaceController());

    Get.put(ArtDiscoveryContainerController());
    Get.put(ArtCommunityController());
    Get.put(CollaborateController());
    Get.put(ArtMarketplaceController());
  }
}

    // Get.lazyPut<UserProfileContainerController>(() => UserProfileContainerController());
    // Get.lazyPut<ArtistProfileController>(() => ArtistProfileController());
    // Get.lazyPut<ArtworkController>(() => ArtworkController());
    // Get.lazyPut<CollaborateitemController>(() => CollaborateitemController());
