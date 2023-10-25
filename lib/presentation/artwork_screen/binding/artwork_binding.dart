import '../controller/artwork_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtworkScreen.
///
/// This class ensures that the ArtworkController is created when the
/// ArtworkScreen is first loaded.
class ArtworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtworkController());
  }
}
