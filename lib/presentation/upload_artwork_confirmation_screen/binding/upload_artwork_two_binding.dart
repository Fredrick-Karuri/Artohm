import '../controller/upload_artwork_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UploadArtworkConfirmationScreen.
///
/// This class ensures that the UploadArtworkConfirmationController is created when the
/// UploadArtworkConfirmationScreen is first loaded.
class UploadArtworkTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadArtworkConfirmationController());
  }
}
