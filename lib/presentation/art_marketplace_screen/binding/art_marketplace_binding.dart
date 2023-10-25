import '../controller/art_marketplace_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtMarketplaceScreen.
///
/// This class ensures that the ArtMarketplaceController is created when the
/// ArtMarketplaceScreen is first loaded.
class ArtMarketplaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtMarketplaceController());
  }
}
