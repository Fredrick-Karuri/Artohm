import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';

class ArtworksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtworksController());
    Get.lazyPut(() => LikedArtworksController(
          artworksController:
              Get.find(), // Get the instance of ArtworksController
          localStorageService:
              Get.find(), // Get the instance of LocalStorageService
        ));
  }
}
