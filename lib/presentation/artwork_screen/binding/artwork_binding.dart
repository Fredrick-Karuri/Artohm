import 'package:artohmapp/data/localStorage.dart';

import '../controller/artwork_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtworkScreen.
///
/// This class ensures that the ArtworkController is created when the
/// ArtworkScreen is first loaded.
class ArtworkBinding extends Bindings {
  @override
  void dependencies() {
    // find local storage else initialize it
    Get.lazyPut(() => LocalStorageService());
    Get.lazyPut<ArtworkController>(
        () => ArtworkController(Get.arguments, Get.find()));
  }
}
