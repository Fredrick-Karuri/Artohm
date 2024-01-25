import 'package:get/get.dart';

import '../controller/your_artworks_controller.dart';

class YourArtworksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourArtworksController>(() => YourArtworksController());
  }
}
