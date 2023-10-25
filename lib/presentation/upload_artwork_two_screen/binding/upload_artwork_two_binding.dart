import '../controller/upload_artwork_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UploadArtworkTwoScreen.
///
/// This class ensures that the UploadArtworkTwoController is created when the
/// UploadArtworkTwoScreen is first loaded.
class UploadArtworkTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadArtworkTwoController());
  }
}
