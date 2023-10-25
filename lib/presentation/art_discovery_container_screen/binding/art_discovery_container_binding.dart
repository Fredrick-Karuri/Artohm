import '../controller/art_discovery_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtDiscoveryContainerScreen.
///
/// This class ensures that the ArtDiscoveryContainerController is created when the
/// ArtDiscoveryContainerScreen is first loaded.
class ArtDiscoveryContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtDiscoveryContainerController());
  }
}
