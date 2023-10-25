import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/models/art_marketplace_model.dart';

/// A controller class for the ArtMarketplaceScreen.
///
/// This class manages the state of the ArtMarketplaceScreen, including the
/// current artMarketplaceModelObj
class ArtMarketplaceController extends GetxController {
  Rx<ArtMarketplaceModel> artMarketplaceModelObj = ArtMarketplaceModel().obs;
}
