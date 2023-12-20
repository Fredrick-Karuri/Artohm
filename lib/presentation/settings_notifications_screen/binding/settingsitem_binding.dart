import '../controller/settingsitem_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SettingsitemScreen.
///
/// This class ensures that the SettingsitemController is created when the
/// SettingsitemScreen is first loaded.
class SettingsitemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsitemController());
  }
}
