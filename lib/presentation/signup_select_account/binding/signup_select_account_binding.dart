import 'package:artohmapp/data/localStorage.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:get/get.dart';
import '../controller/signup_select_account_controller.dart';

class SelectAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountTypeController());
    Get.lazyPut(() => ArtistTrackController());
    Get.lazyPut(() => ArtEnthusiastDetailsController());
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => LocalStorageService()); // Register LocalStorageService
    Get.lazyPut(() => ArtworksController());
  }
}
