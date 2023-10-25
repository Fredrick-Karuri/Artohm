import '../controller/upload_artwork_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UploadArtworkScreen.
///
/// This class ensures that the UploadArtworkController is created when the
/// UploadArtworkScreen is first loaded.
class UploadArtworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadArtworkController());
  }
}
