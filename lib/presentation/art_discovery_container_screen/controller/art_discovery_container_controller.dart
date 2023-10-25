import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/art_discovery_container_screen/models/art_discovery_container_model.dart';

/// A controller class for the ArtDiscoveryContainerScreen.
///
/// This class manages the state of the ArtDiscoveryContainerScreen, including the
/// current artDiscoveryContainerModelObj
class ArtDiscoveryContainerController extends GetxController {
  Rx<ArtDiscoveryContainerModel> artDiscoveryContainerModelObj =
      ArtDiscoveryContainerModel().obs;
}
