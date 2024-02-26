import 'package:artohmapp/data/localStorage.dart';

import '../controller/createcollection_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreatecollectionScreen.
///
/// This class ensures that the CollectionFormController is created when the
/// CreatecollectionScreen is first loaded.
class CreatecollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionFormController(
      LocalStorageService(),
    ));
  }
}
