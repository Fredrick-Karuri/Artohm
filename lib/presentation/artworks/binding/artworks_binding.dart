import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/localStorage.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/signup_select_account/controller/signup_select_account_controller.dart';

class ArtworksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalStorageService());
    Get.lazyPut(() => ArtworksController());
    Get.lazyPut(
      () => LikedArtworksController(
        artworksController:
            Get.find(), // Get the instance of ArtworksController
        localStorageService:
            Get.find(), // Get the instance of LocalStorageService
      ),
    );
    Get.lazyPut(() => CollectionsController(
        localStorageService:
            Get.find(), // Get the instance of LocalStorageService
    ));
  }
}
