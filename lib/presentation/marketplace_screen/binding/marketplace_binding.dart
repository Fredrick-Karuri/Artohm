import '../controller/marketplace_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MarketplaceScreen.
///
/// This class ensures that the MarketplaceController is created when the
/// MarketplaceScreen is first loaded.
class MarketplaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(( ) => MarketplaceController(), permanent:true);
  }
}
