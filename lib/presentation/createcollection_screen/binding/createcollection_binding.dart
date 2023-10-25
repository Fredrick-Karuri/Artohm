import '../controller/createcollection_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreatecollectionScreen.
///
/// This class ensures that the CreatecollectionController is created when the
/// CreatecollectionScreen is first loaded.
class CreatecollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatecollectionController());
  }
}
