import 'package:artohmapp/presentation/artist_profile_screen/models/artist_profile_model.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';

import '../controller/artist_profile_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtistProfileScreen.
///
/// This class ensures that the ArtistController is created when the
/// ArtistProfileScreen is first loaded.
class ArtistProfileBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<ArtworksController>(() => ArtworksController());
    Get.lazyPut<ArtistController>(() => ArtistController(
        artists, Get.find<ArtworksController>().artworks));
  }
}

